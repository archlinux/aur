# Maintainer: polyzen <polycitizen@gmail.com>

pkgname=vimb
pkgver=2.10
pkgrel=1
pkgdesc='The vim-like browser'
arch=('any')
url=http://fanglingsu.github.io/vimb
license=('GPL3')
depends=('webkitgtk')
makedepends=('hardening-wrapper')
source=("vimb-$pkgver.tar.gz::https://github.com/fanglingsu/vimb/archive/$pkgver.tar.gz")
sha256sums=('a46ee9530ec8da62feb3972a80e270c216bc6fb363bb729ceaae1c892513df58')

build() {
  cd vimb-$pkgver
  make GTK=3
}

package() {
  cd vimb-$pkgver
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}

# vim:set ts=2 sw=2 et:
