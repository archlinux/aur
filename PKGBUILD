# Maintainer: James McMurray <jamesmcm03@gmail.com>

_pkgname="vopono"
pkgname=vopono-bin
pkgver=1.0.0
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
sha256sums_x86_64=('87e1422dbaeecd97e341d7c4b3cf6aab81959a67a31eba15b476e45a5a8def93')
sha256sums_armv7h=('d297e642b1c4a5b40cb5cf069dc5d8d99b0929588385b37216db45677bf7f882')
sha256sums_aarch64=('6b84d72442e597121333eb5ba0b81e22c74962e3b1d2f6ef9227126610e78939')
provides=('vopono')
conflicts=('vopono')

package() {
  install -Dm755 ${_pkgname}-${pkgver} "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 vopono.service "${pkgdir}/usr/lib/systemd/system/vopono.service"
}
