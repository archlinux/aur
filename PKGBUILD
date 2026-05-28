# Maintainer: Firstp1ck <firstp1ck@users.noreply.github.com>
pkgname=mini-agent-bin
_pkgname=mini-agent
pkgver=0.1.1
pkgrel=1
pkgdesc='Minimal coding agent with Anthropic/OpenAI LLM loop and local tools (prebuilt binary)'
arch=('x86_64')
url='https://github.com/Firstp1ck/mini-agent'
license=('MIT')
depends=(
  'glibc'
  'hicolor-icon-theme'
  'zlib'
)
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=(
  "${_pkgname}-${pkgver}-linux.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-linux.tar.gz"
  "${_pkgname}-${pkgver}-LICENSE::${url}/raw/v${pkgver}/LICENSE"
)
sha256sums=('1786a68a5b38135ad544bfa5c1b070c449e96615084d14471dcbafd9c8836f18'
            'ed80c1593045458beaf92a78e1ab7929efd610cd48a1096018b34a20aee1771e')

package() {
  cd "${srcdir}/${_pkgname}" || return

  install -Dm755 "bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm755 "bin/${_pkgname}-cli" "${pkgdir}/usr/bin/${_pkgname}-cli"
  install -Dm644 "share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "share/icons/hicolor/256x256/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
