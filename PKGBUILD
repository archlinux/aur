# Maintainer: E-Hern Lee <ehern.lee@gmail.com>
_pkgname=kaiju
pkgname=ghidra-extension-kaiju-bin
pkgdesc="Binary analysis improvements for Ghidra. Can import C++ symbols from OOAnalyer"
pkgver=10.1.5
pkgrel=20220807
arch=('any')
url=https://github.com/CERTCC/kaiju
license=('BSD')
depends=('ghidra=10.1.5')
optdepends=(
  'z3-java: To use the GhiHorn plugin for CFG analysis'
)
makedepends=('unzip')
source=("https://github.com/CERTCC/kaiju/releases/download/ghidra-${pkgver}/ghidra_${pkgver}_PUBLIC_${pkgrel%.*}_kaiju.zip")
sha512sums=('488f0b538c9c67403ebe6da02812cb5b758ad3f90d2a9fd650b1a51ec47506b76fdb43de597d39175ae5778101bee5ace6577aa736141f3c0851f1f55fa97644')

package() {
  cd $srcdir
  install -d $pkgdir/opt/ghidra/Ghidra/Extensions
  unzip -u ghidra_${pkgver}_PUBLIC_${pkgrel%.*}_${_pkgname}.zip -d $pkgdir/opt/ghidra/Ghidra/Extensions/
  install -Dm 644 $_pkgname/LICENSE.txt -t $pkgdir/usr/share/licenses/$pkgname
}
