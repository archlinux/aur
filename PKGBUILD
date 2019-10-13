# Maintainer: Rui Ventura <rventura.pt@outlook.com>
pkgname=chiaki
pkgver=1.0.4
pkgrel=2
pkgdesc='Free and Open Source PS4 Remote Play Client'
arch=('x86_64')
url='https://github.com/thestr4ng3r/chiaki'
license=('GPL')
provides=('chiaki')
depends=('qt5-multimedia' 'qt5-svg' 'ffmpeg' 'libopusenc' 'openssl>=1.1')
makedepends=('cmake' 'protobuf' 'python-protobuf')
source=("$pkgname.tar.gz::$url/releases/download/v$pkgver/$pkgname-v$pkgver-src.tar.gz")
sha256sums=('92f45d6acf87d6340ed7af577e43cf8acabd03b963ea942343e57932379ee1ab')

build() {
  cd "$srcdir/$pkgname"
  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
}
