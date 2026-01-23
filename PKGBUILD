# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="colorstorm"
pkgname="${_pkgname}-bin"
pkgver=3.0.0
pkgrel=1
pkgdesc="An interactive TUI for creating color themes for Vim, VSCode, and Sublime"
arch=(
  'aarch64'
  'armv7h'
  'x86_64'
)
url="https://github.com/benbusby/${_pkgname}"
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
  "${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
  "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE"
)
source_aarch64=(
  "${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_linux_arm64.tar.gz"
)
source_armv7h=(
  "${_pkgsrc}-armv7h.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_linux_arm32.tar.gz"
)
source_x86_64=(
  "${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_linux_x86_64.tar.gz"
)
sha256sums=('79e61f42d6362e2766a5e3304a67e4db0711fd5b9a62fa6dae8a6b75a55304af'
            '124b398c80c0badef18e46b44f0b9cf77ca6e8d5368a26d7d3e89d63799056b8')
sha256sums_aarch64=('7119f99a51d13d5cc6333163d0848bac63e4952d63ae9ebbbbde20b1464f2a06')
sha256sums_armv7h=('c64c76591edde0f4d99dadea5947b509c36994cdff0304cae8265b00724fbc26')
sha256sums_x86_64=('eb19a73a978b121441caa2ea8977eb66e953b23037c276a5c9f709fbc56de227')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
