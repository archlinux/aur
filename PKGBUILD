# Maintainer: TwoWells <mwellsa@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=catenary-bin
pkgver=2.0.1
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
sha256sums=('bc5386a5f34e13d733d84af935b2cea8eaafbbcef0b22c806dddca7283e3b798'
    '0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0')

package() {
    install -Dm755 "catenary-$pkgver-linux-amd64" "$pkgdir/usr/bin/catenary"
    install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=2 sw=2 et:
