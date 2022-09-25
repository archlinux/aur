# Maintainer: E-Hern Lee <ehern.lee@gmail.com>
_pkgname=kaiju
pkgname=ghidra-extension-kaiju-bin
pkgdesc="Binary analysis improvements for Ghidra. Can import C++ symbols from OOAnalyer"
pkgver=10.1.5
pkgrel=20220925
arch=('any')
url=https://github.com/CERTCC/kaiju
license=('BSD')
depends=('ghidra=10.1.5')
optdepends=(
  'z3-java: To use the GhiHorn plugin for CFG analysis'
)
makedepends=('unzip')
source=("https://github.com/CERTCC/kaiju/releases/download/ghidra-${pkgver}/ghidra_${pkgver}_PUBLIC_${pkgrel%.*}_kaiju.zip")
sha512sums=('4a2a806899334d814d1e8c25a9a98238bd0f9e555b6e31fb449eb08708c514e6a3a2ed3a94ec0e06d71697fecfc60df5c8a3cdfdc9aeecf95452bb136572a442')

package() {
  cd $srcdir
  install -d $pkgdir/opt/ghidra/Ghidra/Extensions
  unzip -u ghidra_${pkgver}_PUBLIC_${pkgrel%.*}_${_pkgname}.zip -d $pkgdir/opt/ghidra/Ghidra/Extensions/
  install -Dm 644 $_pkgname/LICENSE.txt -t $pkgdir/usr/share/licenses/$pkgname
}
