pkgname=libfwbt
pkgver=1.1
pkgrel=1
pkgdesc="Parsing & Serialization library for the FWBT format"
arch=('x86_64')
url="https://github.com/FelixEcker/libfwbt"
license=('BSD-3')
depends=('clang' 'mariebuild')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('34c2b1df17e07f354cc43b96a93fb797ffc250ef97cdaf4f0d74883e9168bb8a')

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
