# Maintainer: dungdinhmanh <dungdinhmanh0209 at google mail>

pkgname=schale-pick-bin
_pkgname=schale-pick
pkgver=0.1.1
pkgrel=1
pkgdesc="Your terminal, your Memorial Lobby. Pick a student from the full Kivotos roster and make them your fastfetch portrait."
arch=('x86_64' 'aarch64')
url="https://github.com/dungdinhmanh/schale-pick"
license=('MIT')
depends=('fastfetch' 'jq' 'imagemagick')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${_pkgname}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64")
source_aarch64=("${_pkgname}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm64")
sha256sums=('8695ed1dcccb2b4d357aab6472a21d9a972ace797ea630fba7f619871655ab4b')
sha256sums_x86_64=('f20536baa805202728fde69f9f9e7ae2355cf93c1d57cae57b019e450caf28e7')
sha256sums_aarch64=('cbdad14818c5d05df832c9e39ef125aea9fa88dbc127d3241132ad56be7cdf1c')

package() {
  install -Dm755 "${srcdir}/${_pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
