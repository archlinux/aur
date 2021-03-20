# Current Maintainer: John A. Leuenhagen <john@zlima12.com>
# Previous Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Vinay Shastry <vinayshastry at gmail dot com>

_pkgname='wormhole-william'
pkgname="${_pkgname}-bin"
pkgver=1.0.5
pkgrel=1
pkgdesc='Securely transfer files between devices. Go implementation of magic wormhole.'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://github.com/psanford/wormhole-william'
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("${_pkgname}-${pkgver}-README.md::${url}/raw/v${pkgver}/README.md"
        "${_pkgname}-${pkgver}-LICENSE::${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${_pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64")
source_armv7h=("${_pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm7")
source_aarch64=("${_pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm64")

sha256sums=('51077e6798e4c8aa8444b77c0981601344d64d4f3537a84f49e743ab295f3c58'
            'ee47201dec4798fed875d8768ebfd04f186a74f1bbffe315a0c96b423331f462')
sha256sums_x86_64=('11c8f74102fc03c843c1f290606086a5be53803e804ad21e3722fe86feda6127')
sha256sums_armv7h=('3734b45a495092bbf0eda3a069facfaa509a6add7448e82d3bed71a8f9a4e37d')
sha256sums_aarch64=('14fde996713a92481c7f45c0ec378ebf8d09f8517ef546f28d1da2d08c53a0d7')

package() {
  install -Dm755 "${_pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${_pkgname}-${pkgver}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "${_pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
