# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Thomas Girod <tgirod@altu.fr>

_pkgname="zine"
pkgname="${_pkgname}-bin"
pkgver=0.11.2
pkgrel=1
pkgdesc="Fast, Scalable, Flexible Static Site Generator (SSG)"
arch=(
  'aarch64'
  'x86_64'
)
url="https://zine-ssg.io"
_url="https://github.com/kristoff-it/${_pkgname}"
license=(
  'MIT'
)
_pkgsrc="${_pkgname}-${pkgver}"
source=(
  "${_pkgsrc}-README.md::${_url}/raw/refs/tags/v${pkgver}/README.md"
  "${_pkgsrc}-LICENSE::${_url}/raw/refs/tags/v${pkgver}/LICENSE"
)
source_aarch64=(
  "${_pkgsrc}-aarch64.tar.xz::${_url}/releases/download/v${pkgver}/aarch64-linux-musl.tar.xz"
)
source_x86_64=(
  "${_pkgsrc}-x86_64.tar.xz::${_url}/releases/download/v${pkgver}/x86_64-linux-musl.tar.xz"
)
sha256sums=('e057f62c6a3ae3cf81ba28415860094262a2835f819563836e61d71764253986'
            'fce6401325da3777483f1567966de44f712d71bb5c7dcfc5cd15e292b968a7a2')
sha256sums_aarch64=('94139cda5e5f8c9e3c700d0776a434c2cdeed1548ccbf5ba1f2ce114cefc6102')
sha256sums_x86_64=('bab3f47e07efb8126428f8035ecf46e43344965b430aae5f896d65a747f5c19c')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
