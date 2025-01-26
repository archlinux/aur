# Maintainer: Julius Freudenberger <contact@jfreudenberger.de>
# Contributor: Thomas Jost <schnouki@schnouki.net>
# Contributor: Johannes Pfrang <johannespfrang+arch @ gmail.com>
# Contributor: Emanuele 'Lele aka eldios' Calo' <xeldiosx@gmail.com>
# Contributor: Ariel AxionL <arielaxionl@gmail.com | axionl@aosc.io>

_pkgname=teleport
pkgname=teleport-client-bin
pkgver=17.2.2
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
sha256sums_x86_64=('17ede1eb9d6409dc36e80f0c4fa150a956da2647ba4c444aebc7296cd4476bce')
sha256sums_armv7h=('b1403225006263dbd7efdafb67478fff3cdbad1ab15134a7ad1fd89912b9e9ee')
sha256sums_aarch64=('f80ba6b5659d7a12cb2261411556a4bc4276b19c99fd28f8d39000854d7c8b15')

package() {
    cd "${srcdir}/${_pkgname}"

    install -Dm755 tctl "${pkgdir}/usr/bin/tctl"
    install -Dm755 tsh "${pkgdir}/usr/bin/tsh"
}
