# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=blpapi_cpp
pkgver=3.25.11.1
pkgrel=1
pkgdesc="Bloomberg API C++ SDK (BLPAPI)."
arch=("x86_64")
url="https://www.bloomberg.com/professional/support/api-library/"
license=('custom')
depends=('glibc')
source=("https://blpapi.bloomberg.com/download/releases/raw/files/blpapi_cpp_$pkgver-linux.tar.gz")
sha256sums=('87d9ba2e104ece63050297d472e223100a4b450c7b43164e7f4c10eebdc04f99')

package() {
  cd "${pkgname}_$pkgver"
  install -Dm755 "Linux/libblpapi3_64.so" "$pkgdir/usr/lib/libblpapi3_64.so"
  install -Dm644 include/* -t "$pkgdir/usr/include"
  install -Dm644 doc/html/*.{js,html,png,css} -t "$pkgdir/usr/share/doc/$pkgname/html"
  install -Dm644 doc/ChangeLog.txt "$pkgdir/usr/share/doc/ChangeLog.txt"

  # copy license to proper directory
  install -Dm644 License.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
