# Maintainer: JCWasmx86 <JCWasmx86@t-online.de>

pkgname=swift-mesonlsp
pkgver=1.5.1
pkgrel=1
pkgdesc="A language server for meson"
arch=("any")
url="https://github.com/JCWasmx86/Swift-MesonLSP"
license=("GPL3")
makedepends=("swift-language")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/JCWasmx86/Swift-MesonLSP/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("66366ef388559f04d6bc4d2581f592cf27ed7af110ba8558fbcf53b0734b0fd7")

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
