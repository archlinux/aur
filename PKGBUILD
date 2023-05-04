# Maintainer: Thomas Jost <schnouki@schnouki.net>
# Contributor: Johannes Pfrang <johannespfrang+arch @ gmail.com>
# Contributor: Emanuele 'Lele aka eldios' Calo' <xeldiosx@gmail.com>
# Contributor: Ariel AxionL <arielaxionl@gmail.com | axionl@aosc.io>

_pkgname=teleport
pkgname=teleport-client-bin
pkgver=12.3.1
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
sha256sums_x86_64=('430a9b22f2c461054d8938819bcac8cc692875f8a112a746e2299237c07af176')
sha256sums_armv7h=('1cfb2d7ce1ed12bebdab52405ecabb0770e7fbef89ac65aa0d0d729f9c5705bb')
sha256sums_aarch64=('38e45e4d933f2aa29ea00693e67f80dae2a083b80cfe0da657f8abd5aa2e4d6d')

package() {
    cd "${srcdir}/${_pkgname}"

    install -Dm755 tctl "${pkgdir}/usr/bin/tctl"
    install -Dm755 tsh "${pkgdir}/usr/bin/tsh"
}
