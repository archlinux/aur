# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="neonmodem"
pkgname="${_pkgname}-bin"
pkgver=1.1.0
pkgrel=1
pkgdesc="A BBS-style, multi-backend discussion board TUI"
arch=(
  'aarch64'
  'armv6h'
  'armv7h'
  'i686'
  'x86_64')

url="https://neonmodem.com"
_url="https://github.com/mrusme/${_pkgname}"
license=(
  'GPL-3.0-only'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
source_aarch64=(
  "${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz"
)
source_armv6h=(
  "${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv6.tar.gz"
)
source_armv7h=(
  "${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv7.tar.gz"
)
source_i686=(
  "${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_386.tar.gz"
)
source_x86_64=(
  "${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz"
)
sha256sums_aarch64=('c7fbb547214506473869770a620801381fec9acfed6e1a810e0512c0952e2a7b')
sha256sums_armv6h=('d47a15a7ff1fd38731eecb82b8cc9c2ed1207ce382139f6f6a94e959dbfdf21f')
sha256sums_armv7h=('dc299f3c35c91c719ff37e248c520dcbfc2fbaf903361ece1c9e1cfd4d48d0ec')
sha256sums_i686=('2559233ab0c7e9f3f95e8b316538de6744cfb112cea54a3d2c3341f8985bfcec')
sha256sums_x86_64=('f09dd45714bdc9f26687a28fcb03d5855bd87a21bf20e96f7ab584100759eb0a')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -vDm644 "README.md"   -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -vDm644 "LICENSE"     -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
