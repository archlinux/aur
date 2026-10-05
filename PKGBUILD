# Maintainer: colibrisec <noreply@colibrisec.dev>
#
# This file is a template: CI (.github/workflows/release.yml, job
# aur-render) fills in the pkgver and sha256sums placeholders below with
# the release version and real checksums before every push to
# aur.archlinux.org/ojo-bin.git. Don't hand-edit pkgver/sha256sums here
# -- edit the placeholders and let CI fill them in.
pkgname=ojo-bin
pkgver=0.2.4
pkgrel=1
pkgdesc="Security scanner for dependencies, secrets, misconfiguration, and code (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/colibrisec/ojo"
license=('GPL-2.0-only')
provides=('ojo')
conflicts=('ojo')
options=('!strip' '!debug')
source_x86_64=("ojo-$pkgver-x86_64::https://github.com/colibrisec/ojo/releases/download/v$pkgver/ojo_v${pkgver}_linux_amd64")
source_aarch64=("ojo-$pkgver-aarch64::https://github.com/colibrisec/ojo/releases/download/v$pkgver/ojo_v${pkgver}_linux_arm64")
sha256sums_x86_64=('d73f32b4ed3f3eb5015dc3ba5ec52e20b3e22b91e76988ffa432f2f8fcf1f4e1')
sha256sums_aarch64=('0e9c04ef0758fb19991b317446c2afa346d442def2fd070d44c3ca712a976b82')

package() {
  install -Dm755 "ojo-$pkgver-$CARCH" "$pkgdir/usr/bin/ojo"
}
