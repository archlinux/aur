# Maintainer: E-Hern Lee <ehern.lee@gmail.com>
_pkgname=kaiju
pkgname=ghidra-extension-kaiju-bin
pkgdesc="Binary analysis improvements for Ghidra. Can import C++ symbols from OOAnalyer"
pkgver=10.1.4
pkgrel=20220724-2
arch=('any')
url=https://github.com/CERTCC/kaiju
license=('BSD')
depends=('ghidra')
optdepends=(
  'z3-java: To use the GhiHorn plugin for CFG analysis'
)
makedepends=('unzip')
source=("https://github.com/CERTCC/kaiju/releases/download/ghidra-${pkgver}/ghidra_${pkgver}_PUBLIC_${pkgrel}_kaiju.zip")
sha512sums=('90ad26e7c780bdf4a3c7e609fd2d1c33aab4b5947c2ca30f6748672ef8479021452ed737c3380b52755f7e22e6a4032573dfe857e45dbe147affe3dd8487c4ec')

package() {
  cd $srcdir
  install -d $pkgdir/opt/ghidra/Ghidra/Extensions
  unzip -u ghidra_${pkgver}_PUBLIC_${pkgrel}_${_pkgname}.zip -d $pkgdir/opt/ghidra/Ghidra/Extensions/
  install -Dm 644 $_pkgname/LICENSE.txt -t $pkgdir/usr/share/licenses/$pkgname
}
