# Maintainer: Julius Freudenberger <contact@jfreudenberger.de>
# Contributor: Thomas Jost <schnouki@schnouki.net>
# Contributor: Johannes Pfrang <johannespfrang+arch @ gmail.com>
# Contributor: Emanuele 'Lele aka eldios' Calo' <xeldiosx@gmail.com>
# Contributor: Ariel AxionL <arielaxionl@gmail.com | axionl@aosc.io>

_pkgname=teleport
pkgname=teleport-client-bin
pkgver=17.1.6
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
sha256sums_x86_64=('81bd3b1455ddba06f96092a67826c2ea3395d7266c12c3074dae084f9745d9e7')
sha256sums_armv7h=('717034f9098ec11a94ce650c352f2eede08b4eff8d7214d80be24da719205515')
sha256sums_aarch64=('68c491ab1813844e417fe4b2ea95ce768fb2d9a5977014105cb2cd3f46916221')

package() {
    cd "${srcdir}/${_pkgname}"

    install -Dm755 tctl "${pkgdir}/usr/bin/tctl"
    install -Dm755 tsh "${pkgdir}/usr/bin/tsh"
}
