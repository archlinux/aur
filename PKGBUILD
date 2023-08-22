# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='gotify-cli'
pkgname="${_pkgname}-bin"
pkgver=2.2.3
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

sha256sums=('ec5096c0281e3a6a88212a08378c99ad6cb63677742d9d801753d12f1d169bd7'
            '5df0ff608e5281cbd72c7087c1f60b0ed241a627d6249b89ad9da8853c7771f7')
sha256sums_x86_64=('3baeab63dfeed975b4a63f18fa9236e58ff6cfc6f16505562dc8c5cc5c34738e')
sha256sums_armv7h=('60ddb04d47bf157680cd913c29b9ea2c9348dce80951343a29381e99df9a86fc')
sha256sums_aarch64=('04860e411378249db70a67115425801c58bb71789fd6e5e7cfb9aeb5e0da8c2d')

package() {
  install -Dm755 "${_pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${_pkgname}-${pkgver}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "${_pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
