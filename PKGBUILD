# Maintainer: James McMurray <jamesmcm03@gmail.com>

_pkgname="vopono"
pkgname=vopono-bin
pkgver=0.5.1
pkgrel=1
pkgdesc='Run applications through VPN connections in network namespaces'
arch=('x86_64')
url='https://github.com/jamesmcm/vopono'
license=('GPL3')
makedepends=('git' 'rust')
optdepends=('openvpn: for OpenVPN connections' 'wireguard-tools: for Wireguard connections' 'shadowsocks-libev: for Shadowsocks support (Mullvad)')
source=("${_pkgname}::${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_linux_x86-64_musl")
noextract=("${_pkgname}")
sha256sums=('86d8e36cbf1a5ebbe54e0fb37c07ea4db2e91432546e572d9942514da002af0a')
provides=('vopono')
conflicts=('vopono')

package() {
  install -Dm755 ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
}
