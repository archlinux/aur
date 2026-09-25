# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="funzzy"
pkgname="${_pkgname}-bin"
pkgver=2.0.0
pkgrel=1
pkgdesc="A lightweight generic purpose file watcher"
arch=(
  'aarch64'
  'x86_64'
)
url="https://github.com/cristianoliveira/${_pkgname}"
license=(
  'MIT'
)
depends=(
  'glibc'
  'libgcc'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_pkgname}-${pkgver}"
source=(
  "${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
  "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE"
)
source_aarch64=(
  "${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-aarch64-linux.tar.gz"
)
source_x86_64=(
  "${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-x86_64-linux.tar.gz"
)
sha256sums=('1bc77527f7c4864f8ee4c67807b351d3cfa4c4c68e2e51cde4ead17dc606641f'
            '06d192e34ed1d62acb191604c71067f6b40bda375e44f92b953bdb0ad7c524db')
sha256sums_aarch64=('0b218bf058ef7c555832cda9d1cc1ee8439a2f800206a259bc47ee3e5d595d53')
sha256sums_x86_64=('7d7adf669d8f5e34d515b62738476bc2d55d7842eb0ac6252de64b99b16109d8')

package() {
  cd "${srcdir}"
  install -vDm755 "pkg/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  ln -s "${_pkgname}" "${pkgdir}/usr/bin/fzz"
}
