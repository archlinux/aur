# Contributor: sballert <sballert@posteo.de>
# Contributor: Alex Whitt <alex.joseph.whitt@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-swiper
pkgver=0.11.0
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
sha256sums=('2ddc38d3ac7d16b786006565c2aeeb5890ca7c47d46613f5a4486ae3e9d17119')

build() {
  cd "swiper-${pkgver}"
  make clean test compile
}

package() {
  cd "swiper-${pkgver}"
  install -d "${pkgdir}/usr/share/emacs/site-lisp/swiper"
  install -m644 *.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/swiper/"
}
