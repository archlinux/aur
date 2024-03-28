# Maintainer: E-Hern Lee <ehern.lee@gmail.com>
_pkgname=kaiju
pkgname=ghidra-extension-kaiju-bin
pkgdesc="Binary analysis improvements for Ghidra. Can import C++ symbols from OOAnalyer"
pkgver=240327
_pkgdate=240328
_ghidraver=11.0.2
pkgrel=1
arch=('any')
url=https://github.com/CERTCC/kaiju
license=('BSD')
depends=("ghidra>=${_ghidraver}")
optdepends=(
  'z3-java: To use the GhiHorn plugin for CFG analysis'
)
makedepends=('unzip')
source=("kaiju-${pkgver}.zip::https://github.com/CERTCC/kaiju/releases/download/${_pkgdate}/ghidra_${_ghidraver}_PUBLIC_20${pkgver}_kaiju.zip")
sha512sums=('f15a3e28a7205b061206dc7f00451a3521a8c1c0d3f3efa91e841ca1acbabb46abd3ec8aa4c0a85c0d72932bbbd9c9654f0a320ca050cf42215397c7ad84f4cb')

package() {
  cd $srcdir
  install -d $pkgdir/opt/ghidra/Ghidra/Extensions
  unzip -u kaiju-${pkgver}.zip -d $pkgdir/opt/ghidra/Ghidra/Extensions/
  install -Dm 644 $_pkgname/LICENSE.txt -t $pkgdir/usr/share/licenses/$pkgname
}
