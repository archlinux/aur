# Maintainer: Jovial Joe Jayarson <jovial7joe@hotmail.com>
# Contributor: Jovial Joe Jayarson <jovial7joe@hotmail.com>

pkgname=plymouth-theme-aregression
_themename=aregression
pkgver=1.2.0
pkgrel=1
pkgdesc="A sleek boot up plymouth progress bar"
arch=("any")
url="https://github.com/joe733/plymouth-theme-aregression"
license=("MIT")
depends=("plymouth")
makedepends=("git")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/joe733/plymouth-theme-aregression/archive/${pkgver}.tar.gz")
sha256sums=("baceda2b2bb425769c3cc7f013850cf0d81717041e6d0f013b4dbdf620dd6a1d")
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  _themedir="${pkgdir}/usr/share/plymouth/themes/${_themename}"

  for N in "${_themename}.plymouth" assets/*.png "assets/${_themename}.script"; do
    install -Dm644 $N "${_themedir}/${N}"
  done

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

}
