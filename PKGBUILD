# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='gotify-cli'
pkgname="${_pkgname}-bin"
pkgver=2.2.0
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

sha256sums=('fa2dfbccc25ce96508dd332fdf9b57551a1de2e1401dbc7d3fb3df66020f9696'
            '5df0ff608e5281cbd72c7087c1f60b0ed241a627d6249b89ad9da8853c7771f7')
sha256sums_x86_64=('ec4d8a8f478a1997a634d3671c9284de830e8fb0e2596bca936253bd0a4c3e8f')
sha256sums_armv7h=('9d62317fdd044e42a64572957835fcd354063090a2022ea795afa2c364a098d8')
sha256sums_aarch64=('8bd0120027c2e3547abd2524fba7d882e4aec6b0b272ef5cc00f1b6f7d3d5f5e')

package() {
  install -Dm755 "${_pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${_pkgname}-${pkgver}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "${_pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
