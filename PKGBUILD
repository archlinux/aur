# Maintainer: E-Hern Lee <ehern.lee@gmail.com>
_pkgname=kaiju
pkgname=ghidra-extension-kaiju-bin
pkgdesc="Binary analysis improvements for Ghidra. Can import C++ symbols from OOAnalyer"
pkgver=240220
_ghidraver=11.0.1
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
sha512sums=('535a157c3a04012c8e196c788df5fbf9b1c6036216ddaf58288d97aaf64a6ebb08ce2f058e7c6eb972fe1c49c0fd03e9224c09bc2288132713277cc31064667f')

package() {
  cd $srcdir
  install -d $pkgdir/opt/ghidra/Ghidra/Extensions
  unzip -u kaiju-${pkgver}.zip -d $pkgdir/opt/ghidra/Ghidra/Extensions/
  install -Dm 644 $_pkgname/LICENSE.txt -t $pkgdir/usr/share/licenses/$pkgname
}
