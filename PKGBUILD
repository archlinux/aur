# Maintainer: colibrisec <noreply@colibrisec.dev>
#
# This file is a template: CI (.github/workflows/release.yml, job
# aur-render) fills in the pkgver and sha256sums placeholders below with
# the release version and real checksums before every push to
# aur.archlinux.org/ojo-bin.git. Don't hand-edit pkgver/sha256sums here
# -- edit the placeholders and let CI fill them in.
pkgname=ojo-bin
pkgver=0.2.2
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
sha256sums_x86_64=('47fa6fcc65b588964eb29b3247f8b11e8c6d348a8a592c69f39ac98041e563b9')
sha256sums_aarch64=('dd821e98b4266dfe51135dc6b88d3de4b1ba34dc1abb0fdf0539fc469cb3bdce')

package() {
  install -Dm755 "ojo-$pkgver-$CARCH" "$pkgdir/usr/bin/ojo"
}
