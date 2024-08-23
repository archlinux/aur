# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='gotify-cli'
pkgname="${_pkgname}-bin"
pkgver=2.3.2
pkgrel=1
pkgdesc='Command line interface for pushing messages to gotify server'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://github.com/gotify/cli'
license=('MIT')
provides=("${_pkgname}")

source=("${_pkgname}-${pkgver}-README.md::${url}/raw/v${pkgver}/README.md"
        "${_pkgname}-${pkgver}-LICENSE::${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${_pkgname}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64")
source_armv7h=("${_pkgname}-${pkgver}-armv7h::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm-7")
source_aarch64=("${_pkgname}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm64")

sha256sums=('5eed9472de7c82c8e07d286f2ae9e4125930f91791d16b5c4e0a04d65bd8d284'
            '5df0ff608e5281cbd72c7087c1f60b0ed241a627d6249b89ad9da8853c7771f7')
sha256sums_x86_64=('22d42aa978d9c63b9578b82a5c13579655cd266836bff20af5afec17abc1b28f')
sha256sums_armv7h=('dd24d099157e965a6741ed11cb9186a788ccf17162034c2a70fe65a64001c286')
sha256sums_aarch64=('8f647d4382c7628553da7d6cda1eee0397e08b8a822d59e61b965ec4aeef620f')

package() {
  install -Dm755 "${_pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${_pkgname}-${pkgver}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "${_pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
