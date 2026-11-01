# Maintainer: colibrisec <noreply@colibrisec.dev>
#
# This file is a template: CI (.github/workflows/release.yml, job
# aur-render) fills in the pkgver and sha256sums placeholders below with
# the release version and real checksums before every push to
# aur.archlinux.org/ojo-bin.git. Don't hand-edit pkgver/sha256sums here
# -- edit the placeholders and let CI fill them in.
pkgname=ojo-bin
pkgver=0.3.0
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
sha256sums_x86_64=('6f5f3406ef4b9f9f298212f435b71431f30bfadb40b6f86f7e5d026b93cf9918')
sha256sums_aarch64=('ca9d93e85c5d91c49001e84e02a951931c390aa3b79823c72a439c83a16ef4f9')

package() {
  install -Dm755 "ojo-$pkgver-$CARCH" "$pkgdir/usr/bin/ojo"
}
