# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="asnmap"
pkgname="${_pkgname}-bin"
pkgver=1.2.0
pkgrel=1
pkgdesc="CLI for quickly mapping organization network ranges using ASN information"
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
sha256sums_aarch64=('ef46f6d4c98e663bed8043211e0057b3ba98d281161395349dcb030acb69f501')
sha256sums_armv7h=('4fb57665394eed170005e23c15561df7aaeaa8af5d46d480076be784ea5ca342')
sha256sums_i686=('c62e89f8920eeb1002f5e3435639481317f0e164fd453a0696d6c16ae20a1cd7')
sha256sums_x86_64=('38c732ceb6832c00475111a7972e67ba8e5012b9ea4f776108fe38198289d667')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -vDm644 "README.md"   -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -vDm644 "LICENSE"     -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
