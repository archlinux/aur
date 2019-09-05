# Maintainer: Rui Ventura <rventura.pt@outlook.com>
pkgname=chiaki
pkgver=1.0.2
pkgrel=1
pkgdesc='Free and Open Source PS4 Remote Play Client'
arch=('x86_64')
url='https://github.com/thestr4ng3r/chiaki'
license=('GPL')
provides=('chiaki')
depends=('qt5-multimedia' 'qt5-svg' 'ffmpeg' 'libopusenc' 'openssl>=1.1' 'protobuf')
makedepends=('cmake' 'python-protobuf')
source=("$pkgname.tar.gz::$url/releases/download/v$pkgver/$pkgname-v$pkgver-src.tar.gz")
sha256sums=('5effc6ad49fa1bd190fa857fba8a0ad21ca61e251dcbd79c580659f1d16ba85b')

build() {
  cd "$srcdir/$pkgname"
  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
}
