# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="cdncheck"
pkgname="${_pkgname}-bin"
pkgver=1.1.8
pkgrel=1
pkgdesc="A utility to detect various technology for a given IP address"
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
url="https://github.com/projectdiscovery/${_pkgname}"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_aarch64=("${_pkgsrc}-aarch64.zip::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_arm64.zip")
source_armv7h=("${_pkgsrc}-armv7h.zip::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_arm.zip")
source_i686=("${_pkgsrc}-i686.zip::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_386.zip")
source_x86_64=("${_pkgsrc}-x86_64.zip::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_amd64.zip")
sha256sums_aarch64=('c367803947b9a9d5358b836be89d6cc9ca23a61740a942337a59c0d2284d4028')
sha256sums_armv7h=('e3a4997de63c374de2ba782d6a89d917159c23dfc8f9f475eaa256003d1d3150')
sha256sums_i686=('18d2ad2f6bec341e8452c0687fa4cca69163da9aea02d8bc2bb9a71679dc0d8d')
sha256sums_x86_64=('884c3cfbdf7b3e0f7d9be919ac664797c83e24239c782f21f8eda9b98df44f87')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE.md"  "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
}
