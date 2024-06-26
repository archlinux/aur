# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="flow-cli"
pkgname="${_pkgname}-bin"
pkgver=1.20.5
pkgrel=1
pkgdesc="A command-line interface that provides useful utilities for building Flow applications"
arch=('x86_64' 'aarch64')
url="https://docs.onflow.org/${_pkgname}"
_url="https://github.com/onflow/${_pkgname}"
license=('Apache-2.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${_url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${_url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('5ca568a7c57fd64bb9f74ebd94ba7385ec3fddd7adc0ae3cb81dd0a0104d22ed')
sha256sums_aarch64=('bd90033f13552430103dc7a00fa99574e2225b3f75549ae038b5f3b508731f21')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
