# Maintainer: Nym <ops@nymte.ch>
# Maintainer: Pierre Dommerc <pierre@nymtech.net>
# Maintainer: Lawrence Stalder <lawrence.stalder@pm.me>

pkgname=nym-vpnd-bin
pkgver=0.1.7
# upstream version
_pkgver=0.1.7
_release_tag=nym-vpn-core-v0.1.7
pkgrel=1
pkgdesc='NymVPN daemon as a systemd service'
arch=('x86_64')
url='https://github.com/nymtech/nym-vpn-client'
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs' 'dbus' 'libnftnl' 'libmnl')
makedepends=()
provides=('nym-vpnd')
conflicts=('nym-vpnd')
options=(!debug)
source=("$url/releases/download/$_release_tag/nym-vpn-core-v${_pkgver}_linux_x86_64.tar.gz"
    'nym-vpnd.service')
sha256sums=(
    'ed09c0c9fdf582b1daad65b843358e5a9bc62e8aee15079aedb7166f8aa424e6' 
    'e8e234098c198ba3d0692543922fc53434f9a4355338d01c5a8dd5abfb97d255')

package() {
  install -Dm755 "nym-vpn-core-v${_pkgver}_linux_x86_64/nym-vpnd" "$pkgdir/usr/bin/nym-vpnd"
  install -Dm644 nym-vpnd.service "$pkgdir/usr/lib/systemd/system/nym-vpnd.service"
}

