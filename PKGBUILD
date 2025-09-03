# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="tlsx"
pkgname="${_pkgname}-bin"
pkgver=1.2.1
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
sha256sums_aarch64=('76a85d4a9194d5cedf7d527683d28708bee230d8c46cd792bb52e6e9d1295cc0')
sha256sums_armv7h=('cea2dd1f0b8e166498c854c8f2b825fcf0c709a41d6c1cae6c7932ecf89dd638')
sha256sums_i686=('edcb76038909fdabc01d00c041fb0870eaabfeaa69635efa2a75210c54254777')
sha256sums_x86_64=('303d09a130186b3bfe5b53bac17bdd2ed71773659974d6f94286515aea055112')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
