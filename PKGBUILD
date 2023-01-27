# Maintainer: E-Hern Lee <ehern.lee@gmail.com>
_pkgname=kaiju
pkgname=ghidra-extension-kaiju-bin
pkgdesc="Binary analysis improvements for Ghidra. Can import C++ symbols from OOAnalyer"
pkgver=10.2.2
pkgrel=20230127
arch=('any')
url=https://github.com/CERTCC/kaiju
license=('BSD')
depends=("ghidra=${pkgver}")
optdepends=(
  'z3-java: To use the GhiHorn plugin for CFG analysis'
)
makedepends=('unzip')
source=("https://github.com/CERTCC/kaiju/releases/download/ghidra-${pkgver}/ghidra_${pkgver}_PUBLIC_${pkgrel%.*}_kaiju.zip")
sha512sums=('a45d32a69d0a410dadc9c608f57b95146b15ad1b66d7b1ac0e62b8ee263bc51595e8a7b122451f7d5b1f330e516812b6f7baf1eff929d0b5bd10eeaba1b97520')

package() {
  cd $srcdir
  install -d $pkgdir/opt/ghidra/Ghidra/Extensions
  unzip -u ghidra_${pkgver}_PUBLIC_${pkgrel%.*}_${_pkgname}.zip -d $pkgdir/opt/ghidra/Ghidra/Extensions/
  install -Dm 644 $_pkgname/LICENSE.txt -t $pkgdir/usr/share/licenses/$pkgname
}
