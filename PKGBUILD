# Maintainer: James McMurray <jamesmcm03@gmail.com>

_pkgname="vopono"
pkgname=vopono-bin
pkgver=0.10.19
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
sha256sums_x86_64=('9ccd91eb053001eb2f9c178f80dedef1f962a1deb2eee439acf662fe3ecd929b')
sha256sums_armv7h=('f2757ce6906c73acce46a885b93cb76d177f9fdee9f2f7da85f0ee0e3cf89c85')
sha256sums_aarch64=('64796475c9e8905d9ff9c03e850cce34023cebf23b04ff123c9b2554df9df2a9')
provides=('vopono')
conflicts=('vopono')

package() {
  install -Dm755 ${_pkgname}-${pkgver} "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 vopono.service "${pkgdir}/usr/lib/systemd/system/vopono.service"
}
