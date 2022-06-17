# Maintainer: E-Hern Lee <ehern.lee@gmail.com>
_pkgname=kaiju
pkgname=ghidra-extension-kaiju-bin
pkgdesc="Binary analysis improvements for Ghidra. Can import C++ symbols from OOAnalyer"
pkgver=10.1.4
pkgrel=1
_updatedate=20220612
arch=('any')
url=https://github.com/CERTCC/kaiju
license=('BSD')
depends=('ghidra')
makedepends=('unzip')
source=("https://github.com/CERTCC/kaiju/releases/download/ghidra-${pkgver}/ghidra_${pkgver}_PUBLIC_${_updatedate}_kaiju.zip")
sha512sums=('ecf6077fb0c60c3362deba02704cf7e19512e1274033f10daecd8eae2a0f40d0e32a2f34bd06dac495282b927a4acc4304ea3b98b2b66114188e0163dc7e02d7')

package() {
  cd $srcdir
  install -d $pkgdir/opt/ghidra/Ghidra/Extensions
  unzip -u ghidra_${pkgver}_PUBLIC_${_updatedate}_${_pkgname}.zip -d $pkgdir/opt/ghidra/Ghidra/Extensions/
  install -Dm 644 $_pkgname/LICENSE.txt -t $pkgdir/usr/share/licenses/$pkgname
}
