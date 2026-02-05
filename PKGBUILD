# Maintainer: myuki <mioki dot cinnamon650 at 8shield dot net>

_pkgname=qwen-code
pkgname=${_pkgname}-bin
_name=qwen
pkgver=0.9.1
pkgrel=1
pkgdesc="Open-source AI agent based on Gemini CLI by QwenLM"
arch=('any')
url="https://github.com/QwenLM/${_pkgname}"
license=('Apache-2.0')
depends=('nodejs')
provides=("$_pkgname" "${_name}")
conflicts=("$_pkgname" "${_name}")
source=("${_pkgname}-${pkgver}.js::${url}/releases/download/v${pkgver}/cli.js"
        "LICENSE::https://raw.githubusercontent.com/QwenLM/${_pkgname}/v${pkgver}/LICENSE")
sha256sums=('4734a62277f1d04b7faae77824069f3e3840fb695e8725f76c3e13d7e3716e80'
            '55367b61ccd2a016a0159ad886bd66a3ee6cb5e873d0c75c803c897dd245b075')

package() {
  install -Dm755 "${_pkgname}-${pkgver}.js" "${pkgdir}/usr/bin/${_name}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
