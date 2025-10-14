# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="superhtml"
pkgname="${_pkgname}-bin"
pkgver=0.6.2
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
sha256sums=('645ac85d384585b909727a6bb14a549aac424405bcdfa9c25effddb433354fb1'
            'fce6401325da3777483f1567966de44f712d71bb5c7dcfc5cd15e292b968a7a2')
sha256sums_aarch64=('2d21672c0a9290f4e4e2003a41c1b5ec16fae0419a62810abe4ac65546a62896')
sha256sums_x86_64=('e6dd0bd6223d6fb925843800086ece2fb11d8973e08a2d9ccc7a76ce7d0a36e3')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
