# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="deck"
pkgname="${_pkgname}-bin"
pkgver=1.46.0
pkgrel=1
pkgdesc="Configuration management and drift detection for Kong and Kong Enterprise"
arch=('aarch64' 'x86_64')
url="https://github.com/Kong/${_pkgname}"
license=('Apache-2.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_arm64.tar.gz")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_amd64.tar.gz")
b2sums_aarch64=('d68a7c3f15087fe04a2c1929b254d6da90d8eaa8a0cdb426c899556b73bd50a8043ed657b29d931b6f327c0d3a2406340399fab5aeead1c37a93f183c90f3bc9')
b2sums_x86_64=('f7987e64cf49594dc588ef9a22d2c27cf81eadebc8fe3af121d440c3b3e419f11076063d88a58fbafc8aa794a9097a0330233fd9845832b2e8ca6046c7ac0e62')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
