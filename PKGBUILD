# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname="cloudlist"
pkgname="${_pkgname}-bin"
pkgver=1.1.0
pkgrel=1
pkgdesc="Tool for listing Assets from multiple Cloud Providers"
arch=('x86_64' 'i686' 'aarch64' 'arm')
url="https://docs.projectdiscovery.io/tools/${_pkgname}"
_url="https://github.com/projectdiscovery/${_pkgname}"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_x86_64=("${_pkgsrc}-x86_64.zip::${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.zip")
source_i686=("${_pkgsrc}-i686.zip::${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_386.zip")
source_aarch64=("${_pkgsrc}-aarch64.zip::${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.zip")
source_arm=("${_pkgsrc}-arm.zip::${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm.zip")
sha256sums_x86_64=('3bcfd2f472024390ab4e6034276420b6d6d877f2c3e2635e78e4b825a159bba3')
sha256sums_i686=('0014d6fe87edce235eb851f7d169f309238d0e128aca15480a6cc6886e3085cc')
sha256sums_aarch64=('afbb83459360c8bdc4e0b93034cd56840de276dc03ff34f8b6534fc22294ddd5')
sha256sums_arm=('ed3f4049c090a6c049d0d42ea13436dcc021b4a655b6818b064a2624788b133c')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE.md"  "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
}
