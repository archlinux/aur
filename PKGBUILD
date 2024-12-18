# Maintainer: Liam Toaldo <liamtoaldo+gh at gmail dot com>
# Maintainer: Alessandro Salerno <asalerno1710 at gmail dot com>
pkgname=tarman-bin
pkgver=24.11.13
pkgrel=1
pkgdesc="A portable, cross-platform, extensible, and simple package manager for tarballs (and others!)"
arch=('x86_64' 'aarch64')
url="https://github.com/Alessandro-Salerno/tarman"
license=('GPL3')
depends=()
conflicts=('tarman')
provides=('tarman')
replaces=('tarman')
source_x86_64=("tarman::https://github.com/Alessandro-Salerno/tarman/raw/refs/heads/latest-build/linux-x86_64/tarman")
source_aarch64=("tarman::https://github.com/Alessandro-Salerno/tarman/raw/refs/heads/latest-build/linux-arm64/tarman")
sha256sums_x86_64=('SKIP') 
sha256sums_aarch64=('SKIP')

pkgver() {
	# Get latest release's tag as version
    local tag=$(curl -s https://api.github.com/repos/Alessandro-Salerno/tarman/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")')
    tag=${tag//[v]/}
    pkgver=$tag
    echo "$pkgver"
}
package() {
    install -Dm755 "$srcdir/tarman" "$pkgdir/usr/bin/tarman"
}

