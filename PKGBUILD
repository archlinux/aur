# Maintainer: yozachar <dev@void.null>
# Contributor: yozachar <dev@void.null>

pkgname=plymouth-theme-aregression
_themename=aregression
pkgver=2.1.0
pkgrel=1
pkgdesc="A sleek boot up plymouth progress bar"
arch=("any")
url="https://github.com/yozachar/plymouth-theme-aregression"
license=("MIT")
depends=("plymouth")
makedepends=("git")
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/yozachar/plymouth-theme-aregression/archive/v${pkgver}.tar.gz")
sha256sums=("f66d78516c2e25bf9e246cb16727733cf60b2cd7941f4331534b4284d2169f21")
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  _themedir="${pkgdir}/usr/share/plymouth/themes/${_themename}"

  for N in "${_themename}.plymouth" assets/*.png "assets/${_themename}.script"; do
    install -Dm644 $N "${_themedir}/${N}"
  done

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
