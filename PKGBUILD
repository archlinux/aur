# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=blpapi_cpp
pkgver=3.23.0.1
pkgrel=1
pkgdesc="Bloomberg API C++ SDK (BLPAPI)."
arch=("x86_64")
url="https://www.bloomberglabs.com/"
license=('custom')
depends=('glibc')
source=("https://bcms.bloomberg.com/BLPAPI-Generic/blpapi_cpp_$pkgver-linux.tar.gz")
sha256sums=('1fc51d90a7b5af413aabf465b2b22d5efe23f6ee99a010c1cf26c59099ec04c0')

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
