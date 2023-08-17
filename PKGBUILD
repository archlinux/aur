# Maintainer: Fethbita <aur AT fethbita DOT com>

pkgname=verifpal-bin
_pkgname=verifpal
pkgver=0.27.0
pkgrel=1
pkgdesc="Cryptographic protocol analysis for real-world protocols."
arch=('x86_64')
url="https://verifpal.com"
license=('GPL3')
provides=('verifpal')
conflicts=('verifpal')
source=("https://source.symbolic.software/verifpal/verifpal/-/releases/v${pkgver}/downloads/verifpal_${pkgver}_linux_amd64.zip")
sha256sums=('e72861098d117603f4f0eccc5571de07cfc72354bb759e9db0c38886b780a617')

package() {
  cd "${_pkgname}_${pkgver}_linux_amd64"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -dm755 "${pkgdir}/usr/share/doc/${_pkgname}/examples"
  cp -r examples/* "${pkgdir}/usr/share/doc/${_pkgname}/examples/"
}

# vim:set ts=2 sw=2 et:
