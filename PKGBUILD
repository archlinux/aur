# Maintainer: James McMurray <jamesmcm03@gmail.com>

_pkgname="vopono"
pkgname=vopono-bin
pkgver=0.4.1
pkgrel=1
pkgdesc='Run applications through VPN connections in network namespaces'
arch=('x86_64')
url='https://github.com/jamesmcm/vopono'
license=('GPL3')
makedepends=('git' 'rust')
depends=('nftables' 'iptables' 'procps-ng' 'coreutils' 'findutils')
optdepends=('openvpn: for OpenVPN connections' 'wireguard-tools: for Wireguard connections' 'shadowsocks-libev: for Shadowsocks support (Mullvad)')
source=("${_pkgname}::${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_linux_x86-64_musl")
noextract=("${_pkgname}")
sha256sums=('90dde7dc9038149059b95a3ed1ffba377a5f4da17390c2fd80456b01481d65a9')
provides=('vopono')
conflicts=('vopono')

package() {
  install -Dm755 ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
}
