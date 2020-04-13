# Maintainer: Lukas Matt <lukas@matt.wf>
pkgname=libprotoident
pkgver=2.0.14
pkgrel=1
pkgdesc="Network traffic classification library that requires minimal application payload"
arch=('x86_64')
url="https://github.com/wanduow/libprotoident"
license=('LGPL')
depends=('libtrace' 'libflowmanager')
source=("https://github.com/wanduow/$pkgname/archive/$pkgver-$pkgrel.tar.gz")
md5sums=('be697fd02f4b5df6edf3435616728962')
validpgpkeys=('1E9E2C1BCF7639B219FBE159903A00FC06CC137B')

build() {
  cd "$pkgname-$pkgver-$pkgrel"
  ./bootstrap.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver-$pkgrel"
  make DESTDIR="$pkgdir/" install
}
