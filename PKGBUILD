# Maintainer: kupira <skupira27@gmail.com>
pkgname=bluerice
pkgver=0.2.1   # static version
pkgrel=1
pkgdesc="Bluetooth utility with Wofi menu"
arch=('x86_64')
url="https://github.com/kupira/BlueRice"
license=('MIT')
depends=('glib2' 'libnotify' 'bluez-libs' 'wofi')
makedepends=('git')
source=("git+https://github.com/kupira/BlueRice.git")
sha256sums=('SKIP')  # git source, skip checksum

build() {
    cd "$srcdir/BlueRice" || return 1
    echo "Building bluerice using Makefile..."
    make
}

package() {
    cd "$srcdir/BlueRice" || return 1
    echo "Installing bluerice..."
    install -Dm755 bluerice "$pkgdir/usr/bin/bluerice"
}

