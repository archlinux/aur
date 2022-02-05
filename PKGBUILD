# Maintainer: E-Hern Lee <ehern.lee@gmail.com>
_pkgname=kaiju
pkgname=ghidra-extension-kaiju-bin
pkgdesc="Binary analysis improvements for Ghidra. Can import C++ symbols from OOAnalyer"
pkgver=10.1.1
pkgrel=1
_updatedate=20220130
arch=('any')
url=https://github.com/CERTCC/kaiju
license=('BSD')
depends=('ghidra')
makedepends=('unzip')
source=("https://github.com/CERTCC/kaiju/releases/download/ghidra-${pkgver}/ghidra_${pkgver}_PUBLIC_${_updatedate}_kaiju.zip")
sha512sums=('16fde0520a3d78fcaab0621df24ddc6701bd79059b4ecaa6401ce380b440308fed6228c73a48cca255088ffa1920ec31dbaad0d9ae14538b9ce61b6dfade6e10')

package() {
  cd $srcdir
  install -d $pkgdir/opt/ghidra/Ghidra/Extensions
  unzip -u ghidra_${pkgver}_PUBLIC_${_updatedate}_${_pkgname}.zip -d $pkgdir/opt/ghidra/Ghidra/Extensions/
  install -Dm 644 $_pkgname/LICENSE.txt -t $pkgdir/usr/share/licenses/$pkgname
}
