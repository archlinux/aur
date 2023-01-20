# Maintainer: Thomas Jost <schnouki@schnouki.net>
# Contributor: Johannes Pfrang <johannespfrang+arch @ gmail.com>
# Contributor: Emanuele 'Lele aka eldios' Calo' <xeldiosx@gmail.com>
# Contributor: Ariel AxionL <arielaxionl@gmail.com | axionl@aosc.io>

_pkgname=teleport
pkgname=teleport-client-bin
pkgver=11.2.2
pkgrel=1
pkgdesc="Client-only (tsh, tctl) binary package for teleport"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/gravitational/teleport"
license=('Apache')
provides=('teleport-client' 'tctl' 'tsh')
conflicts=('teleport' 'teleport-client' 'tctl' 'tsh')

source_x86_64=("teleport-bin-${pkgver}-x86_64.tar.gz::https://cdn.teleport.dev/teleport-v${pkgver}-linux-amd64-bin.tar.gz")
source_armv7h=("teleport-bin-${pkgver}-armv7h.tar.gz::https://cdn.teleport.dev/teleport-v${pkgver}-linux-arm-bin.tar.gz")
source_aarch64=("teleport-bin-${pkgver}-aarch64.tar.gz::https://cdn.teleport.dev/teleport-v${pkgver}-linux-arm64-bin.tar.gz")
sha256sums_x86_64=('ebb4f22bff1f1243337512c45bcedda02a586e3a91a05501b9fd715cb7c2b5fb')
sha256sums_armv7h=('5f4bd5d3dc7ad98ab736dd4758b2dca72f8c793ddf169416d6b15bcfa752c748')
sha256sums_aarch64=('dbe63e704d063a69bade92e02a87e64c8551d74992ae1f901f3c739318c81b85')

package() {
    cd "${srcdir}/${_pkgname}"

    install -Dm755 tctl "${pkgdir}/usr/bin/tctl"
    install -Dm755 tsh "${pkgdir}/usr/bin/tsh"
}
