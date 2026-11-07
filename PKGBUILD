# Maintainer: John-Michael Mulesa <jmulesa@gmail.com>
pkgname=carryout-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Resumable, verifying downloader for multi-part Google Takeout exports (Pre-compiled Binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/jm2/carryout"
license=('GPL-3.0-or-later')
provides=("carryout=${pkgver}")
conflicts=('carryout')
# The release binaries are static and already stripped: nothing to strip and
# no debug info to split out.
options=('!strip' '!debug')
# The release's Linux archives (binary, README, LICENSE); the sums match the
# release's SHA256SUMS.txt and GitHub's published asset digests.
source_x86_64=("${url}/releases/download/v${pkgver}/carryout_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/carryout_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('5d4752e2e37a4445d38853f80e0721d3b9db18a09ff5b863924e9482bf923753')
sha256sums_aarch64=('c10908e8a8fbe30290c1eb754329fc0df26bf2aa074cb0bd1b214d8eb905f96b')

package() {
  install -Dm755 carryout "${pkgdir}/usr/bin/carryout"
  # GPL-3.0 is in Arch's licenses package; README goes with the docs.
  install -Dm644 README.md "${pkgdir}/usr/share/doc/carryout/README.md"
}
