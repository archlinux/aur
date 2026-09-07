# Maintainer: Fethbita <aur AT fethbita DOT com>

pkgname=verifpal-bin
_pkgname=verifpal
pkgver=1.4.6
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
sha256sums=('d38e6ebaa0c3089b0c55b4d914dd8c3e9d3baff80c6ad547a9156aa24e2fa0b0'
            'aca50e95ac9e649ef164b5178b7fbdb4a4ecbcf922a9afa8f89b630d7cbdff84'
            '38762e3777f4ec00a6f769062a7c3f704fb78ce08303ecff88558da4c49cf9ea')

package() {
  install -Dm644 "$pkgname-$pkgver-manual.pdf" "${pkgdir}/usr/share/doc/${_pkgname}/manual.pdf"
  install -Dm644 "$pkgname-$pkgver-manual-license.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/manual-LICENSE"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -dm755 "${pkgdir}/usr/share/doc/${_pkgname}/examples"
  cp -r examples/* "${pkgdir}/usr/share/doc/${_pkgname}/examples/"
}

# vim:set ts=2 sw=2 et:
