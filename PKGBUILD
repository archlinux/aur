# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname="cloudlist"
pkgname="${_pkgname}-bin"
pkgver=1.2.2
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
sha256sums_aarch64=('118091e7af2468e38b6a976f951c411d43ebbd8885de3d2c032ce588642ee5f8')
sha256sums_armv7h=('e181d8f2ed716b9df5bf5c9b7e8558abd9bfcf24a7bf99860c5af0f5cb224f36')
sha256sums_i686=('3471b426ce0ce64d4d522f04b9040b1d0d542e89555c04a61bfc90580381db6e')
sha256sums_x86_64=('39ad6f9656d3ad8ac3ad951197bbb2c275cf81714c8313d82944858637807d54')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE.md"  "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
}
