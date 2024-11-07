# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=blpapi_cpp
pkgver=3.24.9.1
pkgrel=1
pkgdesc="Bloomberg API C++ SDK (BLPAPI)."
arch=("x86_64")
url="https://www.bloomberg.com/professional/support/api-library/"
license=('custom')
depends=('glibc')
source=("https://blpapi.bloomberg.com/download/releases/raw/files/blpapi_cpp_$pkgver-linux.tar.gz")
sha256sums=('7dbff183c99ac25c148a3bf273a6d2456b902a098b3f964406d992ae65d89c7d')

package() {
  cd "${pkgname}_$pkgver"
  install -Dm755 "Linux/libblpapi3_64.so" "$pkgdir/usr/lib/libblpapi3_64.so"
  install -Dm644 include/* -t "$pkgdir/usr/include"
  install -Dm644 doc/html/*.{js,html,png,css} -t "$pkgdir/usr/share/doc/$pkgname/html"
  install -Dm644 doc/html/search/*.{js,html,png,css} -t "$pkgdir/usr/share/doc/$pkgname/html/search"
  install -Dm644 doc/ChangeLog.txt "$pkgdir/usr/share/doc/ChangeLog.txt"

  # copy license to proper directory
  install -Dm644 License.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
