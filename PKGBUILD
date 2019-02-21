# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=blpapi_cpp
pkgver=3.12.3.1
pkgrel=1
pkgdesc="Bloomberg API C++ SDK (BLPAPI)."
arch=("x86_64")
url="http://www.bloomberglabs.com/"
license=('custom')
depends=()
source=("https://bloomberg.bintray.com/BLPAPI-Experimental-Generic/blpapi_cpp_$pkgver-linux.tar.gz")
sha256sums=('3faf881921912de18eec687f47b976d8d924eb77ba0cfcd565b5330ab99a8765')

package() {
  cd "$srcdir/${pkgname}_$pkgver"
  install -Dm755 "Linux/libblpapi3_64.so" "$pkgdir/usr/lib/libblpapi3_64.so"
  install -Dm644 include/* -t "$pkgdir/usr/include"
  install -Dm644 doc/html/* -t "$pkgdir/usr/share/doc/$pkgname/html"
  install -Dm644 doc/ChangeLog.txt "pkgdir/usr/share/doc/ChangeLog.txt"

  # copy license to proper directory
  install -Dm644 License.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
