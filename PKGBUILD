# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="deck"
pkgname="${_pkgname}-bin"
pkgver=1.40.1
pkgrel=1
pkgdesc="Configuration management and drift detection for Kong and Kong Enterprise"
arch=('x86_64' 'aarch64')
url="https://github.com/Kong/${_pkgname}"
license=('Apache-2.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
b2sums_x86_64=('9327cb8a70f1d6c483d84ba721fc7fc67e223973ae550301c2f3860c39d53ecfc2ac60053a84bb8c31ef8a506d857a4b30b3c2c807c1b25dab5e0a11074c43d3')
b2sums_aarch64=('36c2fde4478a5af9672e2885562d3bd0f003319f27794f6f1e88188980f9dbac1a56c7a8a607abcc2f1eac872aaff31e62027f05eca6b2ee3ebd40a01f36c27f')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
