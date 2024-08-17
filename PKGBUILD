# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname="cloudlist"
pkgname="${_pkgname}-bin"
pkgver=1.0.9
pkgrel=1
pkgdesc="Tool for listing Assets from multiple Cloud Providers"
arch=('x86_64' 'i686' 'aarch64' 'arm')
url="https://docs.projectdiscovery.io/tools/${_pkgname}"
_url="https://github.com/projectdiscovery/${_pkgname}"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_x86_64=("${_pkgsrc}-x86_64.zip::${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.zip")
source_i686=("${_pkgsrc}-i686.zip::${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_386.zip")
source_aarch64=("${_pkgsrc}-aarch64.zip::${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.zip")
source_arm=("${_pkgsrc}-arm.zip::${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm.zip")
sha256sums_x86_64=('eb96c616b7439da465642c6ab3d125722e35910e965d85070a1d5b63e8320939')
sha256sums_i686=('681be83c61ccc21714d996b8644ef1de1bc2e829f4efbdb0a09356167d1d1368')
sha256sums_aarch64=('842b95f3f398ba44405152bdbc3fdc54fe1f474832a83df46d993adb92f23e43')
sha256sums_arm=('5c98e41b5d344a26ecd3192f9b7e1d2afc451f346a4b9190cd71f53a62de23ca')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE.md"  "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
}
