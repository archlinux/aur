# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="ziggy"
pkgname="${_pkgname}-bin"
pkgver=0.2.0
pkgrel=1
pkgdesc="A data serialization language for expressing clear API messages, config files, etc"
arch=(
  'aarch64'
  'x86_64'
)
url="https://ziggy-lang.io"
_url="https://github.com/kristoff-it/${_pkgname}"
license=(
  'MIT'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_pkgname}-${pkgver}"
source=(
  "${_pkgsrc}-README.md::${_url}/raw/refs/tags/v${pkgver}/README.md"
  "${_pkgsrc}-LICENSE::${_url}/raw/refs/tags/v${pkgver}/LICENSE"
)
source_aarch64=(
  "${_pkgsrc}-aarch64-linux.tar.xz::${_url}/releases/download/v${pkgver}/aarch64-linux.tar.xz"
)
source_x86_64=(
  "${_pkgsrc}-x86_64-linux-musl.tar.xz::${_url}/releases/download/v${pkgver}/x86_64-linux-musl.tar.xz"
)
sha256sums=('915f459f7724f3d143be00714eecd6400e3401c95ae7c61d2f2f82b49ee0c431'
            'fce6401325da3777483f1567966de44f712d71bb5c7dcfc5cd15e292b968a7a2')
sha256sums_aarch64=('52e758c3675c17d56f467dba03d7dc9144e4b62bd35bbe68cf78f9eb97ec90f8')
sha256sums_x86_64=('1929fcf92d6f0bb5223cb9404c1c2de770a2ff256c7d85dd5e29e915f45e98d2')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
