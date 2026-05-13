# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=blpapi_cpp
pkgver=3.26.3.1
pkgrel=1
pkgdesc="Bloomberg API C++ SDK (BLPAPI)."
arch=("x86_64")
url="https://www.bloomberg.com/professional/support/api-library/"
license=('custom')
depends=('glibc')
source=("https://blpapi.bloomberg.com/download/releases/raw/files/blpapi_cpp_$pkgver-linux.tar.gz")
sha256sums=('af0d9f0cadf1f90b1f1a633baf9e33507f28ccc7916f60b2e8f42e5cc2133cf2')

package() {
  cd "${pkgname}_$pkgver"
  install -Dm755 "Linux/libblpapi3_64.so" "$pkgdir/usr/lib/libblpapi3_64.so"
  install -Dm644 include/* -t "$pkgdir/usr/include"
  install -Dm644 doc/html/*.{js,html,png,css} -t "$pkgdir/usr/share/doc/$pkgname/html"
  install -Dm644 doc/ChangeLog.txt "$pkgdir/usr/share/doc/ChangeLog.txt"

  # copy license to proper directory
  install -Dm644 License.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
