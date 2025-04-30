# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="cvemap"
pkgname="${_pkgname}-bin"
pkgver=0.0.7
pkgrel=1
pkgdesc="Navigate the CVE jungle with ease"
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
url="https://github.com/projectdiscovery/${_pkgname}"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${url##*/}-${pkgver}"
source_aarch64=("${_pkgsrc}-aarch64.zip::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_arm64.zip")
source_armv7h=("${_pkgsrc}-armv7h.zip::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_arm.zip")
source_i686=("${_pkgsrc}-i686.zip::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_386.zip")
source_x86_64=("${_pkgsrc}-x86_64.zip::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_amd64.zip")
sha256sums_aarch64=('b7a82870329f07ae03e61642bc26ce058c880ad350f043be49764f0738015f8c')
sha256sums_armv7h=('1ce053214f8708e402f6cd178c0964b761cad7a8f7637edc378a453c1743207a')
sha256sums_i686=('1cae895168422f4c041c456e8a0106bc7ab07aca9ba6b729587fe7bb3ccbf53a')
sha256sums_x86_64=('4bc0839c8a5d8a467c638aed18466a180c10e1568c5cfb07a4389bada3741637')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
