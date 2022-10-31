# Maintainer: Lukas Matt <lukas@matt.wf>
pkgname=libprotoident
pkgver=2.0.15
pkgrel=1
pkgdesc="Network traffic classification library that requires minimal application payload"
arch=('x86_64')
url="https://github.com/wanduow/libprotoident"
license=('LGPL')
depends=('libtrace' 'libflowmanager')
source=("https://github.com/wanduow/$pkgname/archive/$pkgver-$pkgrel.tar.gz")
md5sums=('a27e4ad7bd6f450d64e735805e8313d7')
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
