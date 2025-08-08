# Maintainer: Julius Freudenberger <contact@jfreudenberger.de>
# Contributor: Thomas Jost <schnouki@schnouki.net>
# Contributor: Johannes Pfrang <johannespfrang+arch @ gmail.com>
# Contributor: Emanuele 'Lele aka eldios' Calo' <xeldiosx@gmail.com>
# Contributor: Ariel AxionL <arielaxionl@gmail.com | axionl@aosc.io>

_pkgname=teleport
pkgname=teleport-client-bin
pkgver=18.1.4
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
sha256sums_x86_64=('7f9d984d46d130e194e17a3920237184e56ecab848afc4b8ddd5dae72b48a2a2')
sha256sums_armv7h=('577d4783b344a1c9953c82b11c9c9c04359a2fbb2e5e2cd8cdefeea7b69e36f6')
sha256sums_aarch64=('f831690effbf5a8204bd40d336a3cc8d3676797ae7753ff9094a0c9a0e3f079b')

package() {
    cd "${srcdir}/${_pkgname}"

    install -Dm755 tctl "${pkgdir}/usr/bin/tctl"
    install -Dm755 tsh "${pkgdir}/usr/bin/tsh"
}
