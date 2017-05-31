# Maintainer: Morten Linderd <morten@linderud.pw>

pkgname=nageru
pkgver=1.4.0
pkgrel=2

pkgdesc="Nageru is a live video mixer, based around the standard M/E workflow."
arch=(x86_64)
url="https://nageru.sesse.net/"
license=('GPLv3')

depends=('qt5-base' 'qt5-declarative' 'protobuf' 'libepoxy' 'libmicrohttpd' 'lua51' 'movit' 'libusb' 'x264' 'bmusb')
makedepends=('gcc')
optdepends=()
provides=('nageru')

source=("https://nageru.sesse.net/nageru-1.4.0.tar.gz")
sha256sums=('1e2dd90ae7b227f08993b36fcbcb4671a45065f1f2d7ccb29efac811897e6f75')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}

# vim:set ts=2 sw=2 et:
