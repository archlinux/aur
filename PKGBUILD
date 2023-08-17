# Maintainer: Fethbita <aur AT fethbita DOT com>

pkgname=verifpal-bin
_pkgname=verifpal
pkgver=0.27.0
pkgrel=1
pkgdesc="Cryptographic protocol analysis for real-world protocols."
arch=('x86_64')
url="https://verifpal.com"
license=('GPL3' 'custom:cc-by-nc-nd-4.0')
provides=('verifpal')
conflicts=('verifpal')
source=("https://source.symbolic.software/verifpal/verifpal/-/releases/v${pkgver}/downloads/verifpal_${pkgver}_linux_amd64.zip"
        "$pkgname-$pkgver-manual.pdf::https://verifpal.com/res/pdf/manual.pdf"
        "$pkgname-$pkgver-manual-license::https://creativecommons.org/licenses/by-nc-nd/4.0/legalcode.txt")
sha256sums=('e72861098d117603f4f0eccc5571de07cfc72354bb759e9db0c38886b780a617'
            '13154a262636c1dabf8427e282233f9f642681e518a02241152c723a6de657ab'
            '38762e3777f4ec00a6f769062a7c3f704fb78ce08303ecff88558da4c49cf9ea')

package() {
  install -Dm644 "$pkgname-$pkgver-manual.pdf" "${pkgdir}/usr/share/doc/${_pkgname}/manual.pdf"
  install -Dm644 "$pkgname-$pkgver-manual-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/manual-LICENSE"
  cd "${_pkgname}_${pkgver}_linux_amd64"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -dm755 "${pkgdir}/usr/share/doc/${_pkgname}/examples"
  cp -r examples/* "${pkgdir}/usr/share/doc/${_pkgname}/examples/"
}

# vim:set ts=2 sw=2 et:
