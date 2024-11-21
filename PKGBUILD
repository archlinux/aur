# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>


_pkgauthor=Usbac
_pkgname=borealis
pkgname=${_pkgname}-bin
pkgver=0.3.0
pkgrel=1
pkgdesc='The elegant and consistent programming language.'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64')
license=('MIT')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "CHANGELOG-${pkgver}.md::${_urlraw}/CHANGELOG.md"
        "CONTRIBUTING-${pkgver}.md::${_urlraw}/CONTRIBUTING.md")
source_x86_64=("${_pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-linux")
sha256sums=('9565d5d831e47cb5eabe95fccd7ff10ee972b6d5a83cb3b416d5cf5e7ff10ac9'
            '2a1848194da1b9375454714beff8420d2d623490de653895a9f4dac62120b6e6'
            '77a3bac1d4d81967100a0f9ba847e15d8f5bbee70d4f2a83dd5e5a9dd40c60fd'
            '06687a30ff78ed4acab031ca89f3946f59bfd95845e45b58aa06027037bc90f7')
sha256sums_x86_64=('d0961874e7ba5cbeee865f55dfbe7ed829db81162556424e74fb520868a57e64')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
  install -Dm644 "CONTRIBUTING-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CONTRIBUTING.md"
}
