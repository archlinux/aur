# Maintainer: polyzen <polycitizen@gmail.com>

pkgname=vimb
pkgver=2.9
pkgrel=3
pkgdesc='The vim-like browser'
arch=('any')
url=http://fanglingsu.github.io/vimb
license=('GPL3')
depends=('libsoup' 'webkitgtk')
makedepends=('hardening-wrapper')
source=("vimb-$pkgver.tar.gz::https://github.com/fanglingsu/vimb/archive/$pkgver.tar.gz")
sha256sums=('179024e07c133b049d9fb7c487bed9b9a8512b633e1d857e038b26a01d2e3541')

build() {
  cd vimb-$pkgver
  make GTK=3
}

package() {
  cd vimb-$pkgver
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}

# vim:set ts=2 sw=2 et:
