pkgname=libfwbt
pkgver=1.0
pkgrel=1
pkgdesc="Parsing & Serialization library for the FWBT format"
arch=('x86_64')
url="https://github.com/FelixEcker/libfwbt"
license=('BSD-3')
depends=('clang' 'mariebuild')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('581a3b50fc98061180fb5b44af45bd58fa8ff835a0922bc849e0384bd9beb0e0')

libname="$pkgname.so"
pkgconfname="$pkgname.pc"

build() {
  cd "$pkgname-$pkgver/"
  mb -t release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 ./build/release/$libname $pkgdir/usr/lib/$libname
  install -Dm644 include/fwbt.h $pkgdir/usr/include/fwbt.h
  install -Dm644 $pkgconfname $pkgdir/usr/lib/pkgconfig/$pkgconfname
}
