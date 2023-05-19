# Maintainer: E-Hern Lee <ehern.lee@gmail.com>
_pkgname=kaiju
pkgname=ghidra-extension-kaiju-bin
pkgdesc="Binary analysis improvements for Ghidra. Can import C++ symbols from OOAnalyer"
pkgver=230518
_ghidraver=10.3
pkgrel=1
_updatedate=20230519
arch=('any')
url=https://github.com/CERTCC/kaiju
license=('BSD')
depends=("ghidra=${_ghidraver}")
optdepends=(
  'z3-java: To use the GhiHorn plugin for CFG analysis'
)
makedepends=('unzip')
source=("kaiju.zip::https://github.com/CERTCC/kaiju/releases/download/${pkgver}/ghidra_${_ghidraver}_PUBLIC_${_updatedate}_kaiju.zip")
sha512sums=('1fdea635b69bfc41a9f6945de17591bca0ec8b124038362695f2ebe213156f5c7014ec9ad253a0b105da792b1149eb1d4a2d3481d6bcf72ca76797b888bb7fd0')

package() {
  cd $srcdir
  install -d $pkgdir/opt/ghidra/Ghidra/Extensions
  unzip -u kaiju.zip -d $pkgdir/opt/ghidra/Ghidra/Extensions/
  install -Dm 644 $_pkgname/LICENSE.txt -t $pkgdir/usr/share/licenses/$pkgname
}
