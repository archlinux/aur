# Maintainer: Jovial Joe Jayarson <jovial7joe@hotmail.com>
# Contributor: Jovial Joe Jayarson <jovial7joe@hotmail.com>

pkgname=plymouth-theme-aregression
_themename=aregression
pkgver=2.1.0
pkgrel=1
pkgdesc="A sleek boot up plymouth progress bar"
arch=("any")
url="https://github.com/joe733/plymouth-theme-aregression"
license=("MIT")
depends=("plymouth")
makedepends=("git")
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/joe733/plymouth-theme-aregression/archive/v${pkgver}.tar.gz")
sha256sums=("72445b9db5003a3593cecbb23ee2fffb2f0391a3f5dbfd9d584b85c00e3ba7eb")
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  _themedir="${pkgdir}/usr/share/plymouth/themes/${_themename}"

  for N in "${_themename}.plymouth" assets/*.png "assets/${_themename}.script"; do
    install -Dm644 $N "${_themedir}/${N}"
  done

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
