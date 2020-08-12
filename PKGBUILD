# Maintainer: Joshua Rubin <me at jawa dot dev>

pkgname=voacapl
pkgver=0.7.6
pkgrel=1
pkgdesc='HF Propagation Prediction and Ionospheric Communications Analysis'
arch=('x86_64')
url='https://github.com/jawatson/voacapl'
license=('GPL3')
depends=('sh' 'libgfortran.so')
makedepends=('gcc-fortran')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jawatson/voacapl/archive/v.${pkgver}.tar.gz")
md5sums=('26652686c9ca01735448f10e43208a17')
sha1sums=('2b9cab19787c27d0078f1a12c985d9d2f9daaf0a')
sha256sums=('e89ec4b05f05168c3dd9b9883e313a31c9f06095e9b0a0d2e7ea1e1687f7d83e')
sha384sums=('dc6867fab262a2199f360a921e36d3b1c996dd1c7a66bcac9cc60f83f71bc5f0432150c19ef3dafdf4d2fcd6a434d55d')
sha512sums=('192a974cad059ff265af272c195c8184e18785650e194d25906bc75de0c3d99b9730f2e8131e619300b5fe9f6dfb25cf1437b6701d019c5e6574340d8f6e113a')

prepare() {
  cd "$pkgname-v.$pkgver"
  aclocal
  automake --add-missing
  autoreconf
}

build() {
  cd "$pkgname-v.$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-v.$pkgver"
  make DESTDIR="$pkgdir/" install
}
