# Maintainer: Jovial Joe Jayarson <jovial7joe@hotmail.com>

pkgname=plymouth-theme-aregression
_themename=aregression
pkgver=1.1
pkgrel=1
pkgdesc="A sleek boot up plymouth progress bar"
arch=("any")
url="https://github.com/joe733/plymouth-theme-aregression"
license=("MIT")
depends=("plymouth-git")
makedepends=("git")
source=("git+https://github.com/joe733/plymouth-theme-aregression.git")
md5sums=("SKIP")
package() {
  cd "${srcdir}/${pkgname}"
  _themedir="${pkgdir}/usr/share/plymouth/themes/$_themename"

  for N in "${_themename}.plymouth" assets/*.png "assets/${_themename}.script"; do
    install -Dm644 $N "${_themedir}/$N"
  done

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/$pkgname/README.md"

}
