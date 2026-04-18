# Maintainer: Hao Long <aur@esd.cc>
# Co-Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=nuclei
pkgname="${_pkgname}-bin"
pkgver=3.8.0
pkgrel=1
pkgdesc='Fast tool for configurable targeted scanning based on templates offering massive extensibility and ease of use'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://github.com/projectdiscovery/nuclei'
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc')
source=("LICENSE.md::https://github.com/projectdiscovery/nuclei/raw/v${pkgver}/LICENSE.md")
source_i686=("${_pkgname}-${pkgver}-i686.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_386.zip")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.zip")
source_armv7h=("${_pkgname}-${pkgver}-armv7h.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm.zip")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.zip::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.zip")
b2sums=('2029dad2ab2740376273b715f27e950511c8392b1e575226a922a818041dbf95f60eca51f33b3b036cf5cc5b6f8f8b0a81221e1d80ff69f4ddad8e0f8ed37ba2')
b2sums_i686=('30d498a9a0031896d08510c5511f41cf2a87c35d990887a32efee0e40c295f2e1f895f10d2a0948b4eed7ba3200c4a2c7c944627541d07ea8d7a4f548b3d62e9')
b2sums_x86_64=('1b352316ece46cc79a9ede8ca502696726e1f003902e70d8ff19d86a9c1baa0025b6bdc662541b693dc95657b5ae60b64ee810bb6638e2bb237ef2623351d3ae')
b2sums_armv7h=('ba098bb42a4499f4b099c99c41758a45d3e4cffc71feb06e70a7551447f2e6e5173078b612362faeba71e4d58810c948c4e1f0b53e91c12fab0474bfc8c71c80')
b2sums_aarch64=('5feab98e5697767a349f21efe72f0269cae17a90d909c005402bf7ec0a3e3468b69a4f9fb7803b3e3c09e5712e8ccda967df3f1a2edb798fdca6a2b7988cb0ed')

package() {
  install -Dvm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 README*.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE.md' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
