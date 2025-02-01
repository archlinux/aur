# Maintainer: Christopher Cooper <christopher@cg505.com>
pkgname=codename-goose-bin
pkgver=1.0.4
pkgrel=2
pkgdesc="An open-source, extensible AI agent that goes beyond code suggestions - install, execute, edit, and test with any LLM"
arch=('x86_64' 'aarch64')
url="https://github.com/block/goose"
license=('Apache-2.0')
# Based on ldd output, libxcb, dbus, and systemd may be dependencies.
# I have not added them to depends, because it's unclear if they are required or what they do.
depends=()
makedepends=()
provides=('codename-goose')
conflicts=('codename-goose')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.bz2::https://github.com/block/goose/releases/download/v${pkgver}/goose-x86_64-unknown-linux-gnu.tar.bz2")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.bz2::https://github.com/block/goose/releases/download/v${pkgver}/goose-aarch64-unknown-linux-gnu.tar.bz2")
sha256sums_x86_64=('ab9a24659a8180db43f63777e0d256b4b0fd1644a945c436a76ca3f9f97968bf')
sha256sums_aarch64=('068019504c3e801405c1fe9a1d2a883e36af5256bd3c535443a92234cda0c5cd')

package() {
  install -Dm755 "goose" "$pkgdir/usr/bin/goose"
}
