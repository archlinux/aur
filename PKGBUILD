# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Thomas Girod <tgirod@altu.fr>

_pkgname="zine"
pkgname="${_pkgname}-bin"
pkgver=0.14.1
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
  "${_pkgsrc}-aarch64-linux-musl.tar.xz::${_url}/releases/download/v${pkgver}/aarch64-linux-musl.tar.xz"
)
source_x86_64=(
  "${_pkgsrc}-x86_64-linux-musl.tar.xz::${_url}/releases/download/v${pkgver}/x86_64-linux-musl.tar.xz"
)
sha256sums=('96b5a11088711b87c4e23dfb89b85d1a258279d79307eef157209b5900edd82c'
            'fce6401325da3777483f1567966de44f712d71bb5c7dcfc5cd15e292b968a7a2')
sha256sums_aarch64=('3012828b4fccaee951c89bb7a3343ac498926e7bb8d1245abf4e5a81d028abd9')
sha256sums_x86_64=('c04c718db69f160716fd6c78154642eb1eab0b842e72d80ea05765340d5c9dbe')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
