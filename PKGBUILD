# Maintainer: Fethbita <aur AT fethbita DOT com>

pkgname=verifpal-bin
_pkgname=verifpal
pkgver=0.27.2
pkgrel=2
pkgdesc="Cryptographic protocol analysis for real-world protocols."
arch=('x86_64')
url="https://verifpal.com"
license=('GPL3' 'custom:cc-by-nc-nd-4.0')
provides=('verifpal')
conflicts=('verifpal')
source=("https://github.com/symbolicsoft/verifpal/releases/download/v${pkgver}/verifpal_${pkgver}_linux_amd64.zip"
        "$pkgname-$pkgver-manual.pdf::https://verifpal.com/res/pdf/manual.pdf"
        "$pkgname-$pkgver-manual-license.txt::https://creativecommons.org/licenses/by-nc-nd/4.0/legalcode.txt")
sha256sums=('f19ff232fd051f8b65457c2b4399097e055fd30ab601e4f37609970b132f94f3'
            'c7fa06540e3414b5254a74da2b555dbf226a8e09ed11a1085baa00fc808d00a3'
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
