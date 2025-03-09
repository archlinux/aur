# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="oxigraph"
pkgname="${_pkgname}-bin"
pkgver=0.4.9
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
sha256sums=('370c06536bea5ee417884e4469c89d57aa299e8d41f889f27f136fcf0904c970'
            '2b4a0a586d0334dcefda521512501ddd1eb10fbc8633642779946f0af3b99519'
            'a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2'
            '1f4f6736adc52ebfda18bb84947e0ef492bd86a408c0e83872efb75ed5e02838')
sha256sums_aarch64=('ccf49b90ebfe3122e1441616ebf38a3b8730cb7050c531c60f4b77402053a3f0')
sha256sums_x86_64=('8ecf491d9df573b8d3b16c8f18b3192a594306d435a63e0c34e639c0083d4a68')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-CHANGELOG.md" "${pkgdir}/usr/share/doc/${_pkgname}/CHANGELOG.md"
  install -vDm644 "${_pkgsrc}-README.md"    "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE-APACHE-2.0" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-APACHE-2.0"
  install -vDm644 "${_pkgsrc}-LICENSE-MIT"        "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-MIT"
}
