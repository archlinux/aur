# Maintainer: JCWasmx86 <JCWasmx86@t-online.de>

pkgname=swift-mesonlsp
pkgver=3.0.12
pkgrel=1
pkgdesc="A language server for meson"
arch=("any")
url="https://github.com/JCWasmx86/Swift-MesonLSP"
license=("GPL3")
makedepends=("swift-language")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/JCWasmx86/Swift-MesonLSP/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('737645c9e901dbc1667ddd5fc2dfcdbfc12953f1cefee6d4b62c004438da580d')

prepare() {
  cd "Swift-MesonLSP-$pkgver"
}

package() {
  cd "Swift-MesonLSP-$pkgver"
  swift build -c release --static-swift-stdlib
  mkdir -p "${pkgdir}/usr/bin"
  install .build/release/Swift-MesonLSP "${pkgdir}/usr/bin"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
