# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="tlsx"
pkgname="${_pkgname}-bin"
pkgver=1.3.0
pkgrel=1
pkgdesc="Fast and configurable TLS grabber focused on TLS based data collection"
arch=(
  'aarch64'
  'armv7h'
  'i686'
  'x86_64')

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
sha256sums_aarch64=('70a65a286eaeb336d04c06fd1783541096f7b06c5c2e7a22467406ea2c323449')
sha256sums_armv7h=('b7b5fb17c7ee21272aeeb8513f24e478ec5209d0efba8281346e21df7c13102a')
sha256sums_i686=('78022bfabb8004b01fe78c8ee1d22bfedcfb1ba33b0f5aa73bf460fc273c0c5c')
sha256sums_x86_64=('d982c55da676d7f6bfe588550ed19946e3c73234b4a3a11caf105f3ab98564bf')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -vDm644 "README.md"   -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -vDm644 "LICENSE"     -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
