# Maintainer: Geballin - Guillaume Ballin <macniaque at free dot fr>
# Contributor: sballert <sballert@posteo.de>
# Contributor: Alex Whitt <alex.joseph.whitt@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-swiper
pkgver=0.13.4
pkgrel=1
pkgdesc="Ivy - a generic completion frontend for Emacs, Swiper - isearch with an overview"
url="https://github.com/abo-abo/swiper"
arch=('any')
license=('GPL3')
depends=('emacs' 'emacs-avy')
makedepends=('git')
provides=('emacs-swiper')
conflicts=('emacs-swiper')
source=("$pkgname-$pkgver.tar.gz::https://github.com/abo-abo/swiper/archive/${pkgver}.tar.gz")
sha256sums=('2b4d7d52a8408d84a7423d635fb3fc1415d652a36b6c3d68b847516fd6a82185')

build() {
  cd "swiper-${pkgver}"
  make compile
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
