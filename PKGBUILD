# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='nuclei'
pkgname="${_pkgname}-bin"
pkgver=2.1.1
pkgrel=1
pkgdesc='Fast tool for configurable targeted scanning based on templates offering massive extensibility and ease of use'
arch=('x86_64' 'armv6h' 'aarch64')
url='https://github.com/projectdiscovery/nuclei'
license=('MIT')
provides=("${_pkgname}")

source_x86_64=("${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_armv6h=("${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv6.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('cbb9b2cd4e6b131232370a62fd2ba60cbc3ceb6aef61893a959b2233fb0e2b4c')
sha256sums_armv6h=('679349d89bfbff180b060f4a1b270023e7bb22903b54428c2d6e72721b498b19')
sha256sums_aarch64=('ebadf7cfcba0c7ebf33a7bf2e81191165f7d3d0a9e2a81844726792b834f68fa')

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" "${_pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" 'README.md'
  install -Dm644 'LICENSE.md' "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
