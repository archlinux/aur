# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="superhtml"
pkgname="${_pkgname}-bin"
pkgver=0.6.0
pkgrel=1
pkgdesc="HTML Language Server & Templating Language Library"
arch=('aarch64' 'x86_64')
url="https://github.com/kristoff-it/${_pkgname}"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${url##*/}-${pkgver}"
source=("${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE")
source_aarch64=("${_pkgsrc}-aarch64.tar.xz::${url}/releases/download/v${pkgver}/aarch64-linux.tar.xz")
source_x86_64=("${_pkgsrc}-x86_64.tar.xz::${url}/releases/download/v${pkgver}/x86_64-linux-musl.tar.xz")
sha256sums=('1d56d92e67894a7b9efa88d5b57315d90b44380c84659974ad4bd208c0a60e5d'
            'fce6401325da3777483f1567966de44f712d71bb5c7dcfc5cd15e292b968a7a2')
sha256sums_aarch64=('8224eb16dc59d3c565962b065d23876caa5c3ffd5f1ff7e3d44468d8f763f90d')
sha256sums_x86_64=('310ccc33f9d2179bae1fdae60ff481edad42c36618d3ace723b249c1763d2f78')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
