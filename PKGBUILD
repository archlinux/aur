# Maintainer: Nicholas Fraser <nicholas.rd.fraser@gmail.com>
pkgname=msgpack-tools
pkgver=0.5
pkgrel=1
pkgdesc="Command-line tools for converting between MessagePack and JSON"
arch=('i686' 'x86_64' 'mips64el' 'armv6h' 'armv7h' 'arm' 'aarch64')
url="https://github.com/ludocode/msgpack-tools"
license=('MIT')
depends=('gcc-libs')
makedepends=('cmake')
source=(https://github.com/ludocode/msgpack-tools/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('6f382a74fd8715a8a0e6a2561a9f10b16db7604b3139486908b4054709f81d08')

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
