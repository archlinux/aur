# Maintainer: E-Hern Lee <ehern.lee@gmail.com>
_pkgname=kaiju
pkgname=ghidra-extension-kaiju-bin
pkgdesc="Binary analysis improvements for Ghidra. Can import C++ symbols from OOAnalyer"
pkgver=231204
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
sha512sums=('5054f3a06626deb2fdf13d3e8391b7d01cb6858dd114a0686172ea52854c67f19285ed9accc21888e8b0c5163c7b43063ade5675602cdd8e6b9f2dd814c84671')

package() {
  cd $srcdir
  install -d $pkgdir/opt/ghidra/Ghidra/Extensions
  unzip -u kaiju-${pkgver}.zip -d $pkgdir/opt/ghidra/Ghidra/Extensions/
  install -Dm 644 $_pkgname/LICENSE.txt -t $pkgdir/usr/share/licenses/$pkgname
}
