# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="tunnelx"
pkgname="${_pkgname}-bin"
pkgver=0.0.1
pkgrel=1
pkgdesc="Lightweight ingress tunneling tool designed to create a secure SOCKS5 proxy server for routing network traffic"
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
sha256sums_aarch64=('bfddcbf2aea783dc4f52a5fc07564aeea5bbfafe9ee84f54716d1002c317f930')
sha256sums_armv7h=('bc942daafb9ca0bd340b2142a31d54d05d687c0cbc99c5d20f14155aa1b87449')
sha256sums_i686=('a139cc2965b445f7fa76618563507dd9dae3793c435d3dfa82788d962d2bf005')
sha256sums_x86_64=('91e56740ec40c722d10bd93aca58bc17951ada8f252062ec51e92162e4477c40')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
