# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname="cloudlist"
pkgname="${_pkgname}-bin"
pkgver=1.2.1
pkgrel=1
pkgdesc="Tool for listing Assets from multiple Cloud Providers"
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
url="https://docs.projectdiscovery.io/tools/cloudlist"
_url="https://github.com/projectdiscovery/${_pkgname}"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_aarch64=("${_pkgsrc}-aarch64.zip::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_arm64.zip")
source_armv7h=("${_pkgsrc}-armv7h.zip::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_arm.zip")
source_i686=("${_pkgsrc}-i686.zip::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_386.zip")
source_x86_64=("${_pkgsrc}-x86_64.zip::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_amd64.zip")
sha256sums_aarch64=('e417afafdadf403504c11d229d828c0245bc0ae9b5505d8aea54e458a02cedff')
sha256sums_armv7h=('8da44c041cfdb50127bb4d7d5ba3c83879b67142ab48cd76c4e9f89f5b9de0bb')
sha256sums_i686=('12acba4e55838f38c9c97e1fe891a255e881671a4c6e66b2e3274d23f81ba0d0')
sha256sums_x86_64=('e13faccb96c39573bfa7ccfcf766953764cf5aac2e3d392c7f4845187d6303e0')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE.md"  "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
}
