# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="oxigraph"
pkgname="${_pkgname}-bin"
pkgver=0.4.11
pkgrel=1
pkgdesc="SPARQL graph database and RDF toolkit"
arch=('aarch64' 'x86_64')
url="https://github.com/${_pkgname}/${_pkgname}"
license=('Apache-2.0 OR MIT')
depends=('gcc-libs' 'glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-CHANGELOG.md::${url}/raw/refs/tags/v${pkgver}/CHANGELOG.md"
        "${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE-APACHE-2.0::${url}/raw/refs/tags/v${pkgver}/LICENSE-APACHE"
        "${_pkgsrc}-LICENSE-MIT::${url}/raw/refs/tags/v${pkgver}/LICENSE-MIT")
source_aarch64=("${_pkgsrc}-aarch64::${url}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_aarch64_linux_gnu")
source_x86_64=("${_pkgsrc}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_x86_64_linux_gnu")
sha256sums=('8c1e27b61506adc108180a72cbd733f2064a26dc6d8e909f593e94bd8764dc9f'
            'a85f049c9c8712bf76dc163ba7159c7fba56075d72ee1ed98013306ce172eb92'
            'a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2'
            '1f4f6736adc52ebfda18bb84947e0ef492bd86a408c0e83872efb75ed5e02838')
sha256sums_aarch64=('c23506b6ff9c729dde413abc19d74f9ad5a793213f1e2f37dcac8160d4b22be3')
sha256sums_x86_64=('8f4a374c3a0b135eee70ab238c4f3f91c62d4d0e79bda56c5af3e944c2b132ec')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-CHANGELOG.md" "${pkgdir}/usr/share/doc/${_pkgname}/CHANGELOG.md"
  install -vDm644 "${_pkgsrc}-README.md"    "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE-APACHE-2.0" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-APACHE-2.0"
  install -vDm644 "${_pkgsrc}-LICENSE-MIT"        "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-MIT"
}
