# Maintainer: myuki <mioki dot cinnamon650 at 8shield dot net>

_pkgname=qwen-code
pkgname=${_pkgname}-bin
_name=qwen
pkgver=0.12.3
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
sha256sums=('73415b2104b93942f9f9731f49891ad8e546cfe6c03050b809af217a32449ecd'
            '55367b61ccd2a016a0159ad886bd66a3ee6cb5e873d0c75c803c897dd245b075'
            '729be4baa7cd839aa383910df26d15111d2af1e4c5415f5bb01ff949881fe8cb')

package() {
  install -Dm755 "${_pkgname}-${pkgver}.js" "${pkgdir}/usr/bin/${_name}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "system-defaults.json" "${pkgdir}/etc/qwen-code/system-defaults.json"
}
