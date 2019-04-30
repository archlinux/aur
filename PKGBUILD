# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=blpapi_cpp
pkgver=3.13.1.1
pkgrel=1
pkgdesc="Bloomberg API C++ SDK (BLPAPI)."
arch=("x86_64")
url="https://www.bloomberglabs.com/"
license=('custom')
depends=()
source=("https://bloomberg.bintray.com/BLPAPI-Experimental-Generic/blpapi_cpp_$pkgver-linux.tar.gz")
sha256sums=('7406ad3d134d7c937212870059c1b03cd5f419decd32ea5b40d4e4c9a60beb12')

package() {
  cd "$srcdir/${pkgname}_$pkgver"
  install -Dm755 "Linux/libblpapi3_64.so" "$pkgdir/usr/lib/libblpapi3_64.so"
  install -Dm644 include/* -t "$pkgdir/usr/include"
  install -Dm644 doc/html/* -t "$pkgdir/usr/share/doc/$pkgname/html"
  install -Dm644 doc/ChangeLog.txt "pkgdir/usr/share/doc/ChangeLog.txt"

  # copy license to proper directory
  install -Dm644 License.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
