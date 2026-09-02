# Maintainer: Liam Rooney <liam@roon.dev>

pkgname=blue-yeti-autoreset
pkgver=0.2.0
pkgrel=1
pkgdesc='Automatic recovery for stalled Blue Yeti Classic capture'
arch=('x86_64')
url='https://github.com/lbrooney/blue-yeti-autoreset'
license=('MIT')
depends=('glibc' 'libusb' 'systemd')
makedepends=('pkgconf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2c25d496b981d77b03e47c64ccefb66c21ca7551072be5d1942eca638926a8a8')

build() {
  cd "$pkgname-$pkgver"
  make
}

check() {
  cd "$pkgname-$pkgver"
  make check
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
