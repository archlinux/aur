# Maintainer: myuki <mioki dot cinnamon650 at 8shield dot net>

_pkgname=qwen-code
pkgname=${_pkgname}-bin
_name=qwen
pkgver=0.9.0
pkgrel=1
pkgdesc="open-source AI agent based on Gemini CLI by QwenLM"
arch=('any')
url="https://github.com/QwenLM/${_pkgname}"
license=('Apache-2.0')
depends=('nodejs')
provides=("$_pkgname" "${_name}")
conflicts=("$_pkgname" "${_name}")
source=("${_pkgname}-${pkgver}.js::${url}/releases/download/v${pkgver}/cli.js"
        "LICENSE::https://raw.githubusercontent.com/QwenLM/${_pkgname}/v${pkgver}/LICENSE")
sha256sums=('12fdaf7dd28ab38b0cebc811b08eef7d11febd6dfd607769e27b65f239dd2f1d'
            '55367b61ccd2a016a0159ad886bd66a3ee6cb5e873d0c75c803c897dd245b075')

package() {
  install -Dm755 "${_pkgname}-${pkgver}.js" "${pkgdir}/usr/bin/${_name}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
