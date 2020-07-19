# Maintainer: James McMurray <jamesmcm03@gmail.com>

pkgname=vopono
pkgver=0.2.1
pkgrel=1
pkgdesc='Run applications through VPN connections in network namespaces'
arch=('x86_64')
url='https://github.com/jamesmcm/vopono'
license=('GPL3')
makedepends=('git' 'rust')
depends=('nftables' 'iptables' 'procps-ng' 'coreutils' 'findutils')
optdepends=('openvpn: for OpenVPN connections' 'wireguard-tools: for Wireguard connections')
source=("${pkgname}::${url}/releases/download/${pkgver}/${pkgname}_${pkgver}_linux_x86-64_musl")
noextract=("${pkgname}")
sha256sums=('cd2e8e8fa53802f3a419b12c8121384604c616c40b81c06a97b72e3c35696ae1')
provides=('vopono')
conflicts=('vopono')

package() {
  install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
