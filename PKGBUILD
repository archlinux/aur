# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname="dnsx"
pkgname="${_pkgname}-bin"
pkgver=1.2.2
pkgrel=1
pkgdesc="Fast and multi-purpose DNS toolkit"
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
url="https://docs.projectdiscovery.io/tools/dnsx"
_url="https://github.com/projectdiscovery/${_pkgname}"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_arm64.zip")
source_armv7h=("${_pkgsrc}-armv7h.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_arm.zip")
source_i686=("${_pkgsrc}-i686.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_386.zip")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_amd64.zip")
sha256sums_aarch64=('072c615f7c2acd3d056cbc6a8da105eaffdc78cbc5c3aa549b7fd0e3dc1436e8')
sha256sums_armv7h=('707d8790133b645a86e5282a38cf13773ebbf0c2ba1ef04edaedc23348a36822')
sha256sums_i686=('5a4c1326104d65025fa29990b19c5149e359f6f4d48a2dfa61c7243ed9eff7a8')
sha256sums_x86_64=('dabd54146d63b53fdd08186156ca117fcb79656c66153e3d3c61367aa87a9943')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE.md"  "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
}
