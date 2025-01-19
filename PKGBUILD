# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="oxigraph"
pkgname="${_pkgname}-bin"
pkgver=0.4.7
pkgrel=1
pkgdesc="SPARQL graph database and RDF toolkit"
arch=('aarch64' 'x86_64')
url="https://github.com/${_pkgname}/${_pkgname}"
license=('Apache-2.0 OR MIT')
depends=('gcc-libs' 'glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("CHANGELOG-${pkgver}.md::${url}/raw/refs/tags/v${pkgver}/CHANGELOG.md"
        "README-${pkgver}.md::${url}/raw/refs/tags/v${pkgver}/README.md"
        "LICENSE-APACHE-2.0-${pkgver}::${url}/raw/refs/tags/v${pkgver}/LICENSE-APACHE"
        "LICENSE-MIT-${pkgver}::${url}/raw/refs/tags/v${pkgver}/LICENSE-MIT")
source_aarch64=("${_pkgsrc}-aarch64::${url}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_aarch64_linux_gnu")
source_x86_64=("${_pkgsrc}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_x86_64_linux_gnu")
sha256sums=('2c62f217b74beea3043cf17fd3f0d578941a0be9bcb80a3a0197c73054028e3c'
            'eb8ed92ced12d45f90544631fd20e72b016268d8ae82690ea85cc3643e29dd3f'
            'a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2'
            '1f4f6736adc52ebfda18bb84947e0ef492bd86a408c0e83872efb75ed5e02838')
sha256sums_aarch64=('998ca76d3c2c25d02404fe8e808f8cab6119ee894653d48958fd8a01e8cfb5e7')
sha256sums_x86_64=('d34c1011339ad9337225f64943dbca8f439b495041ba38a1d40f440dd1d28a4b')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/CHANGELOG.md"
  install -vDm644 "README-${pkgver}.md"    "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE-APACHE-2.0-${pkgver}" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-APACHE-2.0"
  install -vDm644 "LICENSE-MIT-${pkgver}"        "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-MIT"
}
