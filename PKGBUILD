# Current Maintainer: John A. Leuenhagen <john@zlima12.com>
# Previous Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Vinay Shastry <vinayshastry at gmail dot com>

_pkgname='wormhole-william'
pkgname="${_pkgname}-bin"
pkgver=1.0.7
pkgrel=1
pkgdesc='Securely transfer files between devices. Go implementation of magic wormhole.'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://github.com/psanford/wormhole-william'
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("${_pkgname}-${pkgver}-README.md::${url}/raw/v${pkgver}/README.md"
        "${_pkgname}-${pkgver}-LICENSE::${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${_pkgname}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64")
source_armv7h=("${_pkgname}-${pkgver}-armv7h::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm7")
source_aarch64=("${_pkgname}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm64")

sha256sums=('ac9d28222e6760081504a4a6cc89d64b5185e05e7fb232e86587cd399f479fae'
            'ee47201dec4798fed875d8768ebfd04f186a74f1bbffe315a0c96b423331f462')
sha256sums_x86_64=('31ca027b4ebc487cb691a61f8efd35428c30ece5fbc9fd50eabf18835395f523')
sha256sums_armv7h=('71c897e75cbfa4ec797d203b25a96535209599277f32569e7b8b94f58cd2ba8d')
sha256sums_aarch64=('e55c0aadf64436e1bd327efc805b72760a8e26552e762fe1be26082668aae383')

package() {
  install -Dm755 "${_pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${_pkgname}-${pkgver}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "${_pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
