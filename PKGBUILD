# Contributor: sballert <sballert@posteo.de>
# Contributor: Alex Whitt <alex.joseph.whitt@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-swiper
pkgver=0.12.0
pkgrel=1
pkgdesc="Ivy - a generic completion frontend for Emacs, Swiper - isearch with an overview"
url="https://github.com/abo-abo/swiper"
arch=('any')
license=('GPL3')
depends=('emacs')
makedepends=('git')
provides=('emacs-swiper')
conflicts=('emacs-swiper')
source=("$pkgname-$pkgver.tar.gz::https://github.com/abo-abo/swiper/archive/${pkgver}.tar.gz")
sha256sums=('e6bd2d41142623e097c041cc061a01ba34ed27623a9c42b227c40f31d8eb7cfa')

build() {
  cd "swiper-${pkgver}"
  make clean compile
}

check() {
  cd "swiper-${pkgver}"
  make test || true
}

package() {
  cd "swiper-${pkgver}"
  install -d "$pkgdir"/usr/share/emacs/site-lisp
  install -m644 *.el{c,} "$pkgdir"/usr/share/emacs/site-lisp
}
