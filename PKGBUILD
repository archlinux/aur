# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="mapcidr"
pkgname="${_pkgname}-bin"
pkgver=1.1.94
pkgrel=1
pkgdesc="Utility program to perform multiple operations for a given subnet/CIDR ranges"
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
url="https://github.com/projectdiscovery/${_pkgname}"
license=('MIT')
# depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${url##*/}-${pkgver}"
source_aarch64=("${_pkgsrc}-aarch64.zip::${url}/releases/download/${pkgver}/${_pkgsrc//-/_}_linux_arm64.zip")
source_armv7h=("${_pkgsrc}-armv7h.zip::${url}/releases/download/${pkgver}/${_pkgsrc//-/_}_linux_arm.zip")
source_i686=("${_pkgsrc}-i686.zip::${url}/releases/download/${pkgver}/${_pkgsrc//-/_}_linux_386.zip")
source_x86_64=("${_pkgsrc}-x86_64.zip::${url}/releases/download/${pkgver}/${_pkgsrc//-/_}_linux_amd64.zip")
sha256sums_aarch64=('d2c915403506ffbba7668066827db30fab849549a457121302c8e5cca3e84006')
sha256sums_armv7h=('75902a3739d9a14b4037df9208ec0bcdffe4694e7ab3ae218bc255d7bbd456f9')
sha256sums_i686=('14d78b49fc2910fc52c7fd1c32055e56d8bc28d53d6a090044100f13d95e47a2')
sha256sums_x86_64=('3ea19e0eeae35c02d70597c9ca34e33e35dc8a3b77e6b6a8ab137940dcf81109')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE.MD"  "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
}
