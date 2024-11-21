# Maintainer: Wraient <rushikeshwastaken@gmail.com>
pkgname='curd'
pkgver=$(curl -s https://api.github.com/repos/Wraient/curd/releases/latest | jq -r '.tag_name' | sed 's/^v//')
pkgrel=1
pkgdesc="Watch anime in CLI with AniList Tracking, Discord RPC, Intro/Outro/Filler/Recap Skipping, etc."
arch=('x86_64')
url="https://github.com/Wraient/curd"
license=('GPL')
depends=('mpv' 'rofi' 'ueberzugpp')
source=("curd::https://github.com/Wraient/curd/releases/latest/download/curd")
sha256sums=('SKIP')

# Function to fetch the latest release tag
pkgver() {
    # Fetch the latest release tag from GitHub and set it as pkgver
    curl -s https://api.github.com/repos/Wraient/curd/releases/latest | jq -r '.tag_name' | sed 's/^v//'
}

package() {
    # Install the precompiled binary into /usr/bin
    install -Dm755 "$srcdir/curd" "$pkgdir/usr/bin/curd"
}

