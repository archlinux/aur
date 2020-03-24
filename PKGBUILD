# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=blpapi_cpp
pkgver=3.14.3.1
pkgrel=1
pkgdesc="Bloomberg API C++ SDK (BLPAPI)."
arch=("x86_64")
url="https://www.bloomberglabs.com/"
license=('custom')
depends=()
source=("https://bloomberg.bintray.com/BLPAPI-Experimental-Generic/blpapi_cpp_$pkgver-linux.tar.gz")
sha256sums=('ba70ae2cba4cba571cf7b1d68cf6bcf20f1abac854e7a82e0950a7fb60ee7c59')

package() {
  cd "$srcdir/${pkgname}_$pkgver"
  install -Dm755 "Linux/libblpapi3_64.so" "$pkgdir/usr/lib/libblpapi3_64.so"
  install -Dm644 include/* -t "$pkgdir/usr/include"
  install -Dm644 doc/html/* -t "$pkgdir/usr/share/doc/$pkgname/html"
  install -Dm644 doc/ChangeLog.txt "pkgdir/usr/share/doc/ChangeLog.txt"

  # copy license to proper directory
  install -Dm644 License.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
