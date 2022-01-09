# Current Maintainer: John A. Leuenhagen <john@zlima12.com>
# Previous Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Vinay Shastry <vinayshastry at gmail dot com>

_pkgname='wormhole-william'
pkgname="${_pkgname}-bin"
pkgver=1.0.6
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

sha256sums=('038dd1af9f5ff03d5c0d8d4f0afc975d18d4559f46abe95c56e17023ad912157'
            'ee47201dec4798fed875d8768ebfd04f186a74f1bbffe315a0c96b423331f462')
sha256sums_x86_64=('68bd9d4e94a01f237bd65d79c81db054269cc4acf034b8ea52bcd220f08d0d47')
sha256sums_armv7h=('de9d68d47f9743f6d9653aad5fdbcc329e85c5aa470172603285bbee00f5e2d9')
sha256sums_aarch64=('f725f669f6a0261fe542af037f0b4346b2c6bfb99b527dac4ca5f100c67a1ca1')

package() {
  install -Dm755 "${_pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${_pkgname}-${pkgver}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "${_pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
