# Maintainer: Nicholas Fraser <nicholas.rd.fraser@gmail.com>
pkgname=msgpack-tools
pkgver=0.4
pkgrel=1
pkgdesc="Command-line tools for converting between MessagePack and JSON"
arch=('i686' 'x86_64' 'mips64el' 'armv6h' 'armv7h' 'arm' 'aarch64')
url="https://github.com/ludocode/msgpack-tools"
license=('MIT')
depends=('gcc-libs')
makedepends=('cmake')
source=(https://github.com/ludocode/msgpack-tools/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('6ca77477ed47ccf4ac882ace3ee5f33a7bc7b929d12c5f10fa0c8fb5874fbc10')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
