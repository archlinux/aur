# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="uncover"
pkgname="${_pkgname}-bin"
pkgver=1.2.0
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
sha256sums_aarch64=('2e9428729192bda4d618acbc244d5d2763bfdef1d12b21cdd14b5037917bbc83')
sha256sums_armv7h=('9d86c8875d1a9265354eee51c53713c0178fd65e9e9e642469a534ae5a1d3cf4')
sha256sums_i686=('47c307c7108443b7058e06b9b521ecd14b549f5d67708b7b94931b634dde7608')
sha256sums_x86_64=('8a5d15a6b0b92903438fdc71c07fbcd76937b63db9ed77ad8740dc5caf0e6cc0')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE.md"  "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
}
