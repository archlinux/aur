# Contributor: sballert <sballert@posteo.de>
# Contributor: Alex Whitt <alex.joseph.whitt@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-swiper
pkgver=0.10.0
pkgrel=2
pkgdesc="Ivy - a generic completion frontend for Emacs, Swiper - isearch with an overview"
url="https://github.com/abo-abo/swiper"
arch=('any')
license=('GPL3')
depends=('emacs')
makedepends=('git')
provides=('emacs-swiper')
conflicts=('emacs-swiper')
source=("$pkgname-$pkgver.tar.gz::https://github.com/abo-abo/swiper/archive/${pkgver}.tar.gz")
sha256sums=('b507579202e438103f2bd1925b4a5ddb9dccb85efdca5faf786d07f58521816e')

build() {
  cd "swiper-${pkgver}"
  make clean test compile
}

package() {
  cd "swiper-${pkgver}"
  install -d "${pkgdir}/usr/share/emacs/site-lisp/swiper"
  install -m644 *.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/swiper/"
}
