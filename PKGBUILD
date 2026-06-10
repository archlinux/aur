# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="superhtml"
pkgname="${_pkgname}-bin"
pkgver=0.7.0
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
sha256sums=('ee07727542c03ad4b54b61dac8b4765ad4e2d2fe2963e07fac38609e94622ff8'
            'fce6401325da3777483f1567966de44f712d71bb5c7dcfc5cd15e292b968a7a2')
sha256sums_aarch64=('9fa2ed1ec830464c38929531693e7129ae6df3ccb1bb3f01fec3322ed5759fc5')
sha256sums_x86_64=('b75c6eeef539416096eac38729ee54e5f3b248f039cab4f57660f29a88742f68')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
