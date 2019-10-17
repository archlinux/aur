# Contributor: sballert <sballert@posteo.de>
# Contributor: Alex Whitt <alex.joseph.whitt@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-swiper
pkgver=0.13.0
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
sha256sums=('ef70b0dffc34513f64b4470948044527c9455705e05cb5b92e370714dfb8a3a2')

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
