# Maintainer: Jason Ryan <jasonwryan@gmail.com>
# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=vimb
pkgver=2.12
pkgrel=1
pkgdesc='The vim-like browser'
arch=('i686' 'x86_64')
url=http://fanglingsu.github.io/vimb
license=('GPL3')
depends=('webkitgtk2')
makedepends=('hardening-wrapper')
source=("vimb-$pkgver.tar.gz::https://github.com/fanglingsu/vimb/archive/$pkgver.tar.gz")
sha256sums=('2443a27d625ff2a7aa7e7b694ec853e25dbdcb33b7c681c98c8fe81b1833b0b7')

build() {
  cd vimb-"$pkgver"
  make GTK=3
}

package() {
  cd vimb-"$pkgver"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}

# vim:set ts=2 sw=2 et:
