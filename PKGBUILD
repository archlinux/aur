# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=blpapi_cpp
pkgver=3.20.2.1
pkgrel=1
pkgdesc="Bloomberg API C++ SDK (BLPAPI)."
arch=("x86_64")
url="https://www.bloomberglabs.com/"
license=('custom')
depends=('glibc')
source=("https://bcms.bloomberg.com/BLPAPI-Generic/blpapi_cpp_$pkgver-linux.tar.gz")
sha256sums=('f23e275d809995b4ed21aa0071ac61350342697928b4da4f55016c619f28facd')

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
