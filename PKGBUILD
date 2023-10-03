# Maintainer: E-Hern Lee <ehern.lee@gmail.com>
_pkgname=kaiju
pkgname=ghidra-extension-kaiju-bin
pkgdesc="Binary analysis improvements for Ghidra. Can import C++ symbols from OOAnalyer"
pkgver=231003
_ghidraver=10.4
pkgrel=1
arch=('any')
url=https://github.com/CERTCC/kaiju
license=('BSD')
depends=("ghidra>=${_ghidraver}")
optdepends=(
  'z3-java: To use the GhiHorn plugin for CFG analysis'
)
makedepends=('unzip')
source=("kaiju-${pkgver}.zip::https://github.com/CERTCC/kaiju/releases/download/${pkgver}/ghidra_${_ghidraver}_PUBLIC_20${pkgver}_kaiju.zip")
sha512sums=('8c80acd6570dfabbf22bb9851f261dcc01dd4c31d4c3868f1b51450f30fbf616d6a5f807ec3242011a4ed2408ed2a5c50f6c36d5da39460190b58f46370c6110')

package() {
  cd $srcdir
  install -d $pkgdir/opt/ghidra/Ghidra/Extensions
  unzip -u kaiju-${pkgver}.zip -d $pkgdir/opt/ghidra/Ghidra/Extensions/
  install -Dm 644 $_pkgname/LICENSE.txt -t $pkgdir/usr/share/licenses/$pkgname
}
