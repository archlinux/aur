# Maintainer: TwoWells <mwellsa@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=catenary-bin
pkgver=2.1.2
pkgrel=1
pkgdesc="LSP-powered code intelligence for AI coding agents (prebuilt binary)"
arch=('x86_64')
url="https://github.com/TwoWells/Catenary"
license=('AGPL-3.0-or-later')
depends=('gcc-libs')
provides=('catenary')
conflicts=('catenary')
# Prebuilt binary is already stripped upstream; skip the (empty) debug split.
options=('!debug' '!strip')
# The release asset is the bare binary (no tarball); the AGPL LICENSE is
# fetched separately from the tagged tree (the repo also carries
# LICENSE-COMMERCIAL — dual licensing — but the distributed grant is the AGPL).
source=("catenary-$pkgver-linux-amd64::https://github.com/TwoWells/Catenary/releases/download/v$pkgver/catenary-linux-amd64"
    "LICENSE-$pkgver::https://raw.githubusercontent.com/TwoWells/Catenary/v$pkgver/LICENSE")
sha256sums=('0bde1c25253e8dc7bcae6efe6c1148138cb593d51ebb8150147843f33a06eb4d'
            '4536a8a77757f57e16cb8b4a490e1dd52d01e63945a3a53e5fd99168b2ffdd48')

package() {
    install -Dm755 "catenary-$pkgver-linux-amd64" "$pkgdir/usr/bin/catenary"
    install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=2 sw=2 et:
