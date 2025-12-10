# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname="dnsx"
pkgname="${_pkgname}-bin"
pkgver=1.2.3
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
sha256sums_aarch64=('e52b1dc48ea4713ad0fd0e731edbe2156e094c44623d7dade3735790c703c8f3')
sha256sums_armv7h=('3c7b462fda12b91509cd3fe07d48db00b06fe36c5d42fbffcc3291d2cd47be78')
sha256sums_i686=('532424b8cfc568f0acf814d4038598fe49f57e523f72f332104227fc7ad643fd')
sha256sums_x86_64=('f58d93f511c1e1f653eac2ae1d44be8ea1ee8eba0d95825ab54ca2be6b9d703d')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE.md"  "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
}
