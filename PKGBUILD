# Maintainer: Wraient <rushikeshwastaken@gmail.com>
pkgname='myd'
pkgver=v0.1
pkgrel=2
pkgdesc="Manage your dotfiles"
arch=("x86_64")
url="https://github.com/Wraient/myd"
license=('GPL')
source=("myd::https://github.com/Wraient/myd/releases/latest/download/myd")
sha256sums=('SKIP')

pkgver() {
    # Fetch the latest release tag from GitHub and set it as pkgver
    local latest_release
    latest_release=$(curl -s https://api.github.com/repos/Wraient/myd/releases/latest | grep -Po '"tag_name": "\K.*?(?=")')
    echo "$latest_release"
}

package() {
    # Install the precompiled binary into /usr/bin
    install -Dm755 "$srcdir/myd" "$pkgdir/usr/bin/myd"
}
