# Maintainer: Wraient <rushikeshwastaken@gmail.com>
pkgname='bootdev-local'
pkgver=0.0.1
pkgrel=2
pkgdesc="Get paid boot.dev Courses offline"
arch=("x86_64")
url="https://github.com/Wraient/bootdev-local"
license=('GPL')
source=("bootdev-local::https://github.com/Wraient/bootdev-local/releases/latest/download/main")
sha256sums=('SKIP')

pkgver() {
    # Fetch the latest release tag from GitHub and set it as pkgver
    local latest_release
    latest_release=$(curl -s https://api.github.com/repos/Wraient/bootdev-local/releases/latest | grep -Po '"tag_name": "\K.*?(?=")')
    echo "${latest_release#v}"
}

package() {
    # Install the precompiled binary into /usr/bin
    install -Dm755 "$srcdir/bootdev-local" "$pkgdir/usr/bin/bootdev-local"
}
