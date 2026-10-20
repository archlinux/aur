# Maintainer: Liam Rooney <liam@roon.dev>

pkgname=blue-yeti-autoreset
pkgver=0.2.1
pkgrel=1
pkgdesc='Automatic recovery for stalled Blue Yeti Classic capture'
arch=('x86_64')
url='https://github.com/lbrooney/blue-yeti-autoreset'
license=('MIT')
depends=('glibc' 'libusb' 'systemd')
makedepends=('pkgconf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8d261481092013f9eb087faad7076082afb7cc569873339621f9fb5f83724523')

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
