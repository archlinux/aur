# Maintainer: E-Hern Lee <ehern.lee@gmail.com>
_pkgname=kaiju
pkgname=ghidra-extension-kaiju-bin
pkgdesc="Binary analysis improvements for Ghidra. Can import C++ symbols from OOAnalyer"
pkgver=231227
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
sha512sums=('8ccdb02f87efe89e8d8b30aa8796d692a7290c8b3df6baa354ac58568068227e3cd5e155334da70d75d790cac84ae396121f343513c01552fcf9bd766db866ef')

package() {
  cd $srcdir
  install -d $pkgdir/opt/ghidra/Ghidra/Extensions
  unzip -u kaiju-${pkgver}.zip -d $pkgdir/opt/ghidra/Ghidra/Extensions/
  install -Dm 644 $_pkgname/LICENSE.txt -t $pkgdir/usr/share/licenses/$pkgname
}
