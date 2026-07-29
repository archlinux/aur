# Maintainer: Fethbita <aur AT fethbita DOT com>

pkgname=verifpal-bin
_pkgname=verifpal
pkgver=0.53.0
pkgrel=1
pkgdesc="Cryptographic protocol analysis for real-world protocols."
arch=('x86_64')
url="https://verifpal.com"
license=('GPL3' 'custom:cc-by-nc-nd-4.0')
provides=('verifpal')
conflicts=('verifpal')
source=("https://github.com/symbolicsoft/verifpal/releases/download/v${pkgver}/verifpal_${pkgver}_linux_amd64.zip"
        "$pkgname-$pkgver-manual.pdf::https://static.verifpal.com/manual.pdf"
        "$pkgname-$pkgver-manual-license.txt::https://creativecommons.org/licenses/by-nc-nd/4.0/legalcode.txt")
sha256sums=('af1a4c5ed00e2507fa048f3dd91e2a4f19ac02c12c3b058ed5745a1b244acebb'
            '5760656e323ca946e780c3bf60eed400ffe4376e48c5fc5024c6dab35c3fe0df'
            '38762e3777f4ec00a6f769062a7c3f704fb78ce08303ecff88558da4c49cf9ea')

package() {
  install -Dm644 "$pkgname-$pkgver-manual.pdf" "${pkgdir}/usr/share/doc/${_pkgname}/manual.pdf"
  install -Dm644 "$pkgname-$pkgver-manual-license.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/manual-LICENSE"
  cd "${_pkgname}_${pkgver}_linux_amd64"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -dm755 "${pkgdir}/usr/share/doc/${_pkgname}/examples"
  cp -r examples/* "${pkgdir}/usr/share/doc/${_pkgname}/examples/"
}

# vim:set ts=2 sw=2 et:
