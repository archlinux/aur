# Maintainer: Wraient <rushikeshwastaken@gmail.com>
pkgname='octopus-player'
pkgver=v0.0.1
pkgrel=2
pkgdesc="Watch shows CLI with playback tracking"
arch=("x86_64")
url="https://github.com/Wraient/octopus"
license=('GPL')
depends=('mpv' 'rofi')
source=("octopus::https://github.com/Wraient/octopus/releases/latest/download/octopus")
sha256sums=('SKIP')

pkgver() {
    # Fetch the latest release tag from GitHub and set it as pkgver
    local latest_release
    latest_release=$(curl -s https://api.github.com/repos/Wraient/octopus/releases/latest | grep -Po '"tag_name": "\K.*?(?=")')
    echo "$latest_release"
}

package() {
    # Install the precompiled binary into /usr/bin
    install -Dm755 "$srcdir/octopus" "$pkgdir/usr/bin/octopus"
}
