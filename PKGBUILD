# Maintainer: Hong Shick Pak <hong@hspak.com>

pkgname=blpapi_cpp
pkgver=3.8.8.1
pkgrel=1
pkgdesc="The Bloomberg API (BLPAPI) is a set of freely available software development kits (SDKs) that allow software developers to create applications that consume market data. C++ SDK."
arch=('x86_64')
url="http://www.bloomberglabs.com/"
license=('custom')
depends=()
source=(http://static.bloomberglabs.com/api/cpp/blpapi_cpp_$pkgver-linux.tar.gz)
md5sums=(ea59bce8a21a0cc2fd947991feec2894)

package() {
  cd "$srcdir/blpapi_cpp_$pkgver"

  mkdir -p "$pkgdir/usr/lib"
  mkdir -p "$pkgdir/usr/include"
  mkdir -p "$pkgdir/usr/share/doc/blpapi_cpp/"
  cp -dpr --no-preserve=ownership Linux/*.so "$pkgdir/usr/lib"
  cp -dpr --no-preserve=ownership include "$pkgdir/usr/"
  cp -dpr --no-preserve=ownership doc "$pkgdir/usr/share/doc/blpapi_cpp/"

  # copy license to proper directory
  install -Dm644 License.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
