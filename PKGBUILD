# Maintainer: E-Hern Lee <ehern.lee@gmail.com>
_pkgname=kaiju
pkgname=ghidra-extension-kaiju-bin
pkgdesc="Binary analysis improvements for Ghidra. Can import C++ symbols from OOAnalyer"
pkgver=10.1.5
pkgrel=20220821
arch=('any')
url=https://github.com/CERTCC/kaiju
license=('BSD')
depends=('ghidra=10.1.5')
optdepends=(
  'z3-java: To use the GhiHorn plugin for CFG analysis'
)
makedepends=('unzip')
source=("https://github.com/CERTCC/kaiju/releases/download/ghidra-${pkgver}/ghidra_${pkgver}_PUBLIC_${pkgrel%.*}_kaiju.zip")
sha512sums=('6de806befbf2aff6c1693769095eb83efa71cc853cbde495b144e4e8c8d0b370f292a451b2ba6d9aa07e6a444f7167b432557cac80a1f043d5b1a7b0ec3045ac')

package() {
  cd $srcdir
  install -d $pkgdir/opt/ghidra/Ghidra/Extensions
  unzip -u ghidra_${pkgver}_PUBLIC_${pkgrel%.*}_${_pkgname}.zip -d $pkgdir/opt/ghidra/Ghidra/Extensions/
  install -Dm 644 $_pkgname/LICENSE.txt -t $pkgdir/usr/share/licenses/$pkgname
}
