# Maintainer: Liam Rooney <liam@roon.dev>

pkgname=blue-yeti-autoreset
pkgver=0.3.0
pkgrel=1
pkgdesc='Automatic recovery for stalled Blue Yeti Classic capture'
arch=('x86_64')
url='https://github.com/lbrooney/blue-yeti-autoreset'
license=('MIT')
depends=('glibc' 'libusb' 'systemd')
makedepends=('pkgconf')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('169021d5030aa5391c20c1532ae3b232caa45cd5dfaa4ee9121f75668345bd7e')

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
