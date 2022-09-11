# Maintainer: E-Hern Lee <ehern.lee@gmail.com>
_pkgname=kaiju
pkgname=ghidra-extension-kaiju-bin
pkgdesc="Binary analysis improvements for Ghidra. Can import C++ symbols from OOAnalyer"
pkgver=10.1.5
pkgrel=20220911
arch=('any')
url=https://github.com/CERTCC/kaiju
license=('BSD')
depends=('ghidra=10.1.5')
optdepends=(
  'z3-java: To use the GhiHorn plugin for CFG analysis'
)
makedepends=('unzip')
source=("https://github.com/CERTCC/kaiju/releases/download/ghidra-${pkgver}/ghidra_${pkgver}_PUBLIC_${pkgrel%.*}_kaiju.zip")
sha512sums=('636a4a7b5797a9728f4ea2981641deb3864124e87c885ca53b374db607019908ad8ffe797341fd40df5e626b079636c9e6227eb6c4575f89d9acd9cb5b304e62')

package() {
  cd $srcdir
  install -d $pkgdir/opt/ghidra/Ghidra/Extensions
  unzip -u ghidra_${pkgver}_PUBLIC_${pkgrel%.*}_${_pkgname}.zip -d $pkgdir/opt/ghidra/Ghidra/Extensions/
  install -Dm 644 $_pkgname/LICENSE.txt -t $pkgdir/usr/share/licenses/$pkgname
}
