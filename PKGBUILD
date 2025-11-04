# Maintainer: Nym <ops@nymte.ch>
# Maintainer: Pierre Dommerc <pierre@nymtech.net>
# Maintainer: Lawrence Stalder <lawrence.stalder@pm.me>

pkgname=nym-vpnd-bin
pkgver=1.18.0
# upstream version
_pkgver=1.18.0
_release_tag=nym-vpn-core-v1.18.0
pkgrel=2
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
    '881ead31cfd3322ee1af142bcbdaac7a1e2cfcfea6ee6ba761de8b1670160b7d' 
    '66d5b043cbef2ae0ba19cc7685c7b42808515b8b520b0dd15a0c313ca039f6d6')

package() {
  install -Dm755 "nym-vpn-core-v${_pkgver}_linux_x86_64/nym-vpnd" "$pkgdir/usr/bin/nym-vpnd"
  install -Dm644 nym-vpnd.service "$pkgdir/usr/lib/systemd/system/nym-vpnd.service"
}

