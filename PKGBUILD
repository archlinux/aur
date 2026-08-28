# Maintainer: Liam Rooney <liam@roon.dev>

pkgname=blue-yeti-autoreset
pkgver=0.1.0
pkgrel=1
pkgdesc='Automatic recovery for stalled Blue Yeti Classic capture'
arch=('x86_64')
url='https://github.com/lbrooney/blue-yeti-autoreset'
license=('MIT')
depends=('glibc' 'libusb' 'systemd')
makedepends=('pkgconf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('091407a1cdeca1166142d8d877f8be9f0530f4b4439ea3a3f230990f8c4dc41b')

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
