# Maintainer: Wraient <rushikeshwastaken@gmail.com>
pkgname='curd'
pkgver=v0.0.2
pkgrel=2
pkgdesc="Watch anime in CLI with AniList Tracking, Discord RPC, Intro/Outro/Filler/Recap Skipping, etc."
arch=("x86_64")
url="https://github.com/Wraient/curd"
license=('GPL')
depends=('mpv')
source=("curd::https://github.com/Wraient/curd/releases/latest/download/curd")
sha256sums=('SKIP')

pkgver() {
    # Fetch the latest release tag from GitHub and set it as pkgver
    local latest_release
    latest_release=$(curl -s https://api.github.com/repos/Wraient/curd/releases/latest | grep -Po '"tag_name": "\K.*?(?=")')
    echo "$latest_release"
}

package() {
    # Install the precompiled binary into /usr/bin
    install -Dm755 "$srcdir/curd" "$pkgdir/usr/bin/curd"
}
