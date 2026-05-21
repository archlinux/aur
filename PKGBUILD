# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="uncover"
pkgname="${_pkgname}-bin"
pkgver=1.2.1
pkgrel=1
pkgdesc="Quickly discover exposed hosts on the internet using multiple search engines"
arch=(
  'aarch64'
  'armv7h'
  'i686'
  'x86_64'
)
url="https://github.com/projectdiscovery/${_pkgname}"
license=(
  'MIT'
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
sha256sums_aarch64=('c7b1341708ae877189cf58ca3039b0973e520285e3cd2c314961500163e076bf')
sha256sums_armv7h=('1e6c42657957495f71494f74ec368b61293819b0f7ceee471d1cd020d92bad4e')
sha256sums_i686=('284ee895f0b5d2e5ff13276866e7031a95529907a11c34abd23db5d1b9d8106e')
sha256sums_x86_64=('72cfa1ceaf72ce499a0ed520b738178a99d369321dbc8e10f01e1dd6e1119322')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -vDm644 "README.md"   -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -vDm644 "LICENSE.md"  -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
