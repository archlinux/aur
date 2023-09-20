# Maintainer: JCWasmx86 <JCWasmx86@t-online.de>

pkgname=swift-mesonlsp
pkgver=2.4.2
pkgrel=1
pkgdesc="A language server for meson"
arch=("any")
url="https://github.com/JCWasmx86/Swift-MesonLSP"
license=("GPL3")
makedepends=("swift-language")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/JCWasmx86/Swift-MesonLSP/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1f26451eb15d6b546bac55631dcb3df4497557b77ddad18ac12b77f18619dd44')

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
