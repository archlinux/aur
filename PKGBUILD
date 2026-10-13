# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="funzzy"
pkgname="${_pkgname}-bin"
pkgver=2.0.1
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
sha256sums=('710db1e71256f914b94cdb445caead2ee8166307c6c0bce9617f14b4dd454d8b'
            '06d192e34ed1d62acb191604c71067f6b40bda375e44f92b953bdb0ad7c524db')
sha256sums_aarch64=('4f8a340342fcd344567d86177ef8187d5a77a38f1f71517200c448ed9fd93e3f')
sha256sums_x86_64=('ff46a0f66abf6a7454d1f09f7f036e0bb2d3e5e34a9895ff71e36176511803f7')

package() {
  cd "${srcdir}"
  install -vDm755 "pkg/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  ln -s "${_pkgname}" "${pkgdir}/usr/bin/fzz"
}
