# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=blpapi_cpp
pkgver=3.16.1.1
pkgrel=1
pkgdesc="Bloomberg API C++ SDK (BLPAPI)."
arch=("x86_64")
url="https://www.bloomberglabs.com/"
license=('custom')
depends=('glibc')
source=("https://bcms.bloomberg.com/BLPAPI-Generic/blpapi_cpp_$pkgver-linux.tar.gz")
sha256sums=('d8e0db4b4754f725c052084c09c07e3d111f655fd7079762f23ecc05d6402afd')

package() {
  cd "$srcdir/${pkgname}_$pkgver"
  install -Dm755 "Linux/libblpapi3_64.so" "$pkgdir/usr/lib/libblpapi3_64.so"
  install -Dm644 include/* -t "$pkgdir/usr/include"
  install -Dm644 doc/html/* -t "$pkgdir/usr/share/doc/$pkgname/html"
  install -Dm644 doc/ChangeLog.txt "pkgdir/usr/share/doc/ChangeLog.txt"

  # copy license to proper directory
  install -Dm644 License.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
