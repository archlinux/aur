# Maintainer: Wraient <rushikeshwastaken@gmail.com>
pkgname='flick'
pkgver=v0.0.1
pkgrel=1
pkgdesc="Watch shows CLI with playback tracking"
arch=("x86_64")
url="https://github.com/Wraient/flick"
license=('GPL')
depends=('mpv' 'rofi')
source=("flick::https://github.com/Wraient/flick/releases/latest/download/flick")
sha256sums=('SKIP')

pkgver() {
    # Fetch the latest release tag from GitHub and set it as pkgver
    local latest_release
    latest_release=$(curl -s https://api.github.com/repos/Wraient/flick/releases/latest | grep -Po '"tag_name": "\K.*?(?=")')
    echo "$latest_release"
}

package() {
    # Install the precompiled binary into /usr/bin
    install -Dm755 "$srcdir/flick" "$pkgdir/usr/bin/flick"
}
