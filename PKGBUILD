# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="tldfinder"
pkgname="${_pkgname}-bin"
pkgver=0.0.2
pkgrel=1
pkgdesc="A streamlined tool for discovering private TLDs for security research"
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
sha256sums_aarch64=('252308aaf61ebeb26cb8486c4bf46657702757690834718974bc57d90a58ce6e')
sha256sums_armv7h=('4b152d30b7d3b4a262f988c4f78f915d5522e70c42af5683e395a4988bfaa070')
sha256sums_i686=('deacc30a0157d274fed036ad058a4d497b6523153a6381b6c2a7f8372c90d841')
sha256sums_x86_64=('58f29b7c7ee8ad255972ccc537cf90992d9bfec36a51f2a92ddcfb6cee497883')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
