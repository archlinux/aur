# Maintainer: JCWasmx86 <JCWasmx86@t-online.de>

pkgname=swift-mesonlsp
pkgver=2.3.9
pkgrel=1
pkgdesc="A language server for meson"
arch=("any")
url="https://github.com/JCWasmx86/Swift-MesonLSP"
license=("GPL3")
makedepends=("swift-language")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/JCWasmx86/Swift-MesonLSP/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f5e5e889471998b60f1400d7a172c091805298e8e4ba655af9ca72311164f5ca')

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
