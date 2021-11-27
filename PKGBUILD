# Maintainer: E-Hern Lee <ehern.lee@gmail.com>
_pkgname=kaiju
pkgname=ghidra-extension-kaiju-bin
pkgdesc="Binary analysis improvements for Ghidra. Can import C++ symbols from OOAnalyer"
pkgver=10.0.4
pkgrel=1
_updatedate=20211121
arch=('any')
url=https://github.com/CERTCC/kaiju
license=('BSD')
depends=('ghidra')
makedepends=('unzip')
source=("https://github.com/CERTCC/kaiju/releases/download/ghidra-${pkgver}/ghidra_${pkgver}_PUBLIC_${_updatedate}_kaiju.zip")
sha512sums=('9027b8238658c09134670e278998c274a428de56f8418d069e28b5d1aad13b7786bef8f7f6b24c183d00ee370f6d6e45367e9decfab57e0e3614e1bf82388185')

package() {
  cd $srcdir
  install -d $pkgdir/opt/ghidra/Ghidra/Extensions
  unzip -u ghidra_${pkgver}_PUBLIC_${_updatedate}_${_pkgname}.zip -d $pkgdir/opt/ghidra/Ghidra/Extensions/
  install -Dm 644 $_pkgname/LICENSE.txt -t $pkgdir/usr/share/licenses/$pkgname
}
