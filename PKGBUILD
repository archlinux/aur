# Maintainer: James McMurray <jamesmcm03@gmail.com>

_pkgname="vopono"
pkgname=vopono-bin
pkgver=1.0.1
pkgrel=1
pkgdesc='Run applications through VPN connections in network namespaces'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://github.com/jamesmcm/vopono'
license=('GPL3')
optdepends=('openvpn: for OpenVPN connections' 'wireguard-tools: for Wireguard connections' 'shadowsocks-libev: for Shadowsocks support (Mullvad)' 'openfortivpn: for FortiClient VPN connections' 'libnatpmp: for ProtonVPN port forwarding support' 'trojan: for Trojan Wireguard forwarding support' 'redsocks: for SSH proxy forwarding support' 'openssh: for SSH proxy forwarding support')
install=vopono.install
source=('vopono.service')
source_x86_64=("${_pkgname}-${pkgver}::${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_linux_x86-64_gcc")
source_armv7h=("${_pkgname}-${pkgver}::${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_linux_armv7")
source_aarch64=("${_pkgname}-${pkgver}::${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_linux_aarch64")
noextract=("${_pkgname}-${pkgver}")
sha256sums=('fe558d14c1efa8c2bf638b5882fbf63c98970b76b661f1c8c50a72b6b5553e13')
sha256sums_x86_64=('3f82d4dc590fcf0b1c31abc42f6bf06b941f3fc03ca49bc218a7a652d8f24549')
sha256sums_armv7h=('6d1021814604136ce2ce6c3058e2d4aa02bd1fb8df4c9e73e174bd894aa23521')
sha256sums_aarch64=('db3b3bb4261e10c5deec1821b1e3ee9877027c69ccddc6220526013241bc0b8c')
provides=('vopono')
conflicts=('vopono')

package() {
  install -Dm755 ${_pkgname}-${pkgver} "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 vopono.service "${pkgdir}/usr/lib/systemd/system/vopono.service"
}
