# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname="dnsx"
pkgname="${_pkgname}-bin"
pkgver=1.3.0
pkgrel=1
pkgdesc="Fast and multi-purpose DNS toolkit"
arch=(
  'aarch64'
  'armv7h'
  'i686'
  'x86_64'
)
url="https://docs.projectdiscovery.io/tools/dnsx"
_url="https://github.com/projectdiscovery/${_pkgname}"
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
  "${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.zip"
)
source_armv7h=(
  "${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm.zip"
)
source_i686=(
  "${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_386.zip"
)
source_x86_64=(
  "${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.zip"
)
sha256sums_aarch64=('94dc2d96aed1ae3e680dc09f070e67e48bd796583b8144c1de5bd3425a318847')
sha256sums_armv7h=('ea44753af081f592edfbb6d4884358c5222d5cd09e8143dbea59ad05de25223b')
sha256sums_i686=('74472fab603a054852ea0b080d96ad7179db7a5568d21dc45ea9a6d7275175ea')
sha256sums_x86_64=('1415020474886151a4820c62b9e68a315cc062f7f111a2fd13fda99047a809a6')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -vDm644 "README.md"   -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -vDm644 "LICENSE.md"  -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
