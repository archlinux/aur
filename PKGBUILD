pkgname=rtk-ai-bin
_pkgname=rtk
pkgver=0.35.0
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
sha256sums_x86_64=('30c852a6f415a8a270aaa333c614bb02dfd0d60bc57af382f5bb44c3b61a6ff9'
                   '4044ade9c21d8b084d3d16a03375cf3b7e166b946a327bb37a3fbbdb53287cfd')

package() {
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
