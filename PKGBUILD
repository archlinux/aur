# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="tlsx"
pkgname="${_pkgname}-bin"
pkgver=1.1.9
pkgrel=1
pkgdesc="Fast and configurable TLS grabber focused on TLS based data collection"
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
sha256sums_aarch64=('88cd880d147af363090aae346b32b64867dafa14181e0ebad3f67d90669e8566')
sha256sums_armv7h=('271039dd6ecf0e30e525ff9d99e31d9932bb4bca4f2619f4f908aa7612551f0a')
sha256sums_i686=('5aa0564cc8daadd79be5e57d4d9ca44f088ffc8354fd837b91c0b5a26c40c090')
sha256sums_x86_64=('4b2480ca7be1dadf45ca9e861f3ea1147b56b976fe39f62fe1efa8c40ff8dec7')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
