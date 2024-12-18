# Maintainer: Wraient <rushikeshwastaken@gmail.com>
pkgname='curd'
pkgver=1.0.3
pkgrel=2
pkgdesc="Watch anime in CLI with AniList Tracking, Discord RPC, Intro/Outro/Filler/Recap Skipping, etc."
arch=('x86_64')
url="https://github.com/Wraient/curd"
license=('GPL')
depends=('mpv' 'rofi' 'ueberzugpp')
source=("$pkgname::https://github.com/Wraient/curd/releases/latest/download/curd")
sha256sums=('SKIP')

package() {
    # Install the precompiled binary into /usr/bin
    install -Dm755 "$srcdir/curd" "$pkgdir/usr/bin/curd"
}

pkgver() {
    local ver
    ver=$(curl -s --fail "https://api.github.com/repos/Wraient/curd/releases/latest" | jq -r '.tag_name' | sed 's/^v//')
    if [ -n "$ver" ]; then
        echo "$ver"
    else
        echo "$pkgver"
    fi
}
