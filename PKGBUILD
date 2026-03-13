# Maintainer: myuki <mioki dot cinnamon650 at 8shield dot net>

_pkgname=qwen-code
pkgname=${_pkgname}-bin
_name=qwen
pkgver=0.12.2
pkgrel=1
pkgdesc="Open-source AI agent based on Gemini CLI by QwenLM"
arch=('any')
url="https://github.com/QwenLM/${_pkgname}"
license=('Apache-2.0')
depends=('nodejs')
provides=("$_pkgname" "${_name}")
conflicts=("$_pkgname" "${_name}")
source=("${_pkgname}-${pkgver}.js::${url}/releases/download/v${pkgver}/cli.js"
        "LICENSE::https://raw.githubusercontent.com/QwenLM/${_pkgname}/v${pkgver}/LICENSE"
        "system-defaults.json")
sha256sums=('3474e0cfb5963413148d9b131db011f170f177f43d35fd0d6f6313184f4c705b'
            '55367b61ccd2a016a0159ad886bd66a3ee6cb5e873d0c75c803c897dd245b075'
            '729be4baa7cd839aa383910df26d15111d2af1e4c5415f5bb01ff949881fe8cb')

package() {
  install -Dm755 "${_pkgname}-${pkgver}.js" "${pkgdir}/usr/bin/${_name}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "system-defaults.json" "${pkgdir}/etc/qwen-code/system-defaults.json"
}
