# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="superhtml"
pkgname="${_pkgname}-bin"
pkgver=0.7.1
pkgrel=1
pkgdesc="HTML Language Server & Templating Language Library"
arch=(
  'aarch64'
  'x86_64'
)
url="https://github.com/kristoff-it/${_pkgname}"
license=(
  'MIT'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${url##*/}-${pkgver}"
source=(
  "${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
  "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE"
)
source_aarch64=(
  "${_pkgsrc}-aarch64-linux.tar.xz::${url}/releases/download/v${pkgver}/aarch64-linux.tar.xz"
)
source_x86_64=(
  "${_pkgsrc}-x86_64-linux-musl.tar.xz::${url}/releases/download/v${pkgver}/x86_64-linux-musl.tar.xz"
)
sha256sums=('b0118cf6f077ff76c80c7319cb2c3fc971f275a706f6568871f9a58bea088da6'
            'fce6401325da3777483f1567966de44f712d71bb5c7dcfc5cd15e292b968a7a2')
sha256sums_aarch64=('9ed5bbf8e61a94b13db68eca1666403c654ff4a12c12a458e217331f869394b3')
sha256sums_x86_64=('e5493cb412ea50e3686972f6e114137f0d4f612388d8041a294c8314efa55b35')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
