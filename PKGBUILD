pkgname=rtk-ai-bin
_pkgname=rtk
pkgver=0.37.0
pkgrel=1
pkgdesc='CLI proxy that reduces LLM token consumption by 60-90% on common dev commands'
arch=('x86_64')
url='https://github.com/rtk-ai/rtk'
license=('MIT')
depends=()
provides=('rtk' 'rtk-bin')
conflicts=('rtk' 'rtk-bin')
options=('!strip')
source_x86_64=(
  "${_pkgname}-${pkgver}-x86_64-unknown-linux-musl.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-musl.tar.gz"
  "LICENSE-${pkgver}::https://raw.githubusercontent.com/rtk-ai/rtk/v${pkgver}/LICENSE"
)
sha256sums_x86_64=('52183fe20d68fa14ddc3c1666a1810d821a4fb8334cc71a4c83d551ca4df0cd6'
                   '4044ade9c21d8b084d3d16a03375cf3b7e166b946a327bb37a3fbbdb53287cfd')

package() {
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
