# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="uncover"
pkgname="${_pkgname}-bin"
pkgver=1.0.10
pkgrel=1
pkgdesc="Quickly discover exposed hosts on the internet using multiple search engines"
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
sha256sums_aarch64=('cadce302bf6f913a9416fcb5bc14ff8f8c7aaaecac2f2ff8bdd62e0ed5d23df0')
sha256sums_armv7h=('c434284737b8066133a49a111f477b99be4e4881bfb0c1f7b19055c979f65ef8')
sha256sums_i686=('b7db168b960f48af8abf3df76729e7f1074f15ac6f659e2ed83552a25faceca4')
sha256sums_x86_64=('88d88cdd16a515fb0ef0fd0ed3d12217faeaf796f7da11a44fe77cf6dacaa9fd')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE.md"  "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
}
