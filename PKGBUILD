# Maintainer: Rui Ventura <rventura.pt@outlook.com>
pkgname=chiaki
pkgver=1.0.4
pkgrel=1
pkgdesc='Free and Open Source PS4 Remote Play Client'
arch=('x86_64')
url='https://github.com/thestr4ng3r/chiaki'
license=('GPL')
provides=('chiaki')
depends=('qt5-multimedia' 'qt5-svg' 'ffmpeg' 'libopusenc' 'openssl>=1.1')
makedepends=('cmake' 'protobuf' 'python-protobuf')
source=("$pkgname.tar.gz::$url/releases/download/v$pkgver/$pkgname-v$pkgver-src.tar.gz")
sha256sums=('4210cfe932c22080a50e9b9b04431d7bc1a35782204e2badbb4e71c0ae5ac3a1')

build() {
  cd "$srcdir/$pkgname"
  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
}
