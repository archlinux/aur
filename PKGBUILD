# Maintainer: Thr0TT1e <info@noble24.ru>

_themename=russia
pkgname=plymouth-theme-$_themename
pkgver=1.0.1
pkgrel=1
pkgdesc="Russia coat of arms splash screen for plymouth"
arch=("any")
url=https://notabug.org/Thr0TT1e/russia-theme-plymouth
license=("LGPLv3")
depends=("plymouth")
install="plymouth-theme-$_themename.install"
makedepends=("git")
source=("git+$url.git")
sha512sums=('SKIP')

package(){
  cd "${srcdir}/russia-theme-plymouth"
  _themedir="${pkgdir}/usr/share/plymouth/themes/$_themename"

  for N in "${_themename}.plymouth" "${_themename}.script" *.png; do
    install -Dm644 $N "${_themedir}/$N"
  done

  install -Dm644 ../../LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 ../../README.md "${pkgdir}/usr/share/doc/$pkgname/README.md"
}
