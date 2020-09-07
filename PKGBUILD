# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='nuclei'
pkgname="${_pkgname}-bin"
pkgver=2.1.0
pkgrel=1
pkgdesc='Fast tool for configurable targeted scanning based on templates offering massive extensibility and ease of use'
arch=('x86_64' 'armv6h' 'aarch64')
url='https://github.com/projectdiscovery/nuclei'
license=('MIT')
provides=("${_pkgname}")

source_x86_64=("${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_armv6h=("${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv6.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('29228a11ddca9a4992203facde9c8325f39bbfa8ecf5f8808f1aa243a5412159')
sha256sums_armv6h=('27d6086c83f9d16ee18c69a0e6bb0b0f5f9e01ffcbd5118cdd5ab9501dff7026')
sha256sums_aarch64=('6d37041ef6927b66e6f9ea97a76ed7ade086ee12222a434e0fca6a1cd1ed4fac')

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" "${_pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" 'README.md'
  install -Dm644 'LICENSE.md' "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
