# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: FLX (Paul Werther) <flx@evait.de>

_pkgname="pdtm"
pkgname="${_pkgname}-bin"
pkgver=0.1.4
pkgrel=1
pkgdesc="ProjectDiscovery's Open Source Tool Manager"
arch=(
  'aarch64'
  'armv7h'
  'i686'
  'x86_64')

url="https://github.com/projectdiscovery/${_pkgname}"
license=(
  'MIT'
)
depends=(
  'glibc'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
source_aarch64=(
  "${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.zip"
)
source_armv7h=(
  "${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm.zip"
)
source_i686=(
  "${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_386.zip"
)
source_x86_64=(
  "${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.zip"
)
sha256sums_aarch64=('0538814579772038b404c9ffa9ac97461537385fdcf564b82cab420b66a08a7a')
sha256sums_armv7h=('5883f08c873fa963658b536715f8e3d2d6cd543f579617097613da4f6c986739')
sha256sums_i686=('4fd030941093bb520dd707d29013dd2f74c7dbc8b60941c818b2c3b12a14fc4b')
sha256sums_x86_64=('82d3affda3539b11876bc7e1cc4d30a31cc0ceb3b9577053db800ff00b18f0fc')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -vDm644 "README.md"   -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -vDm644 "LICENSE.md"  -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
