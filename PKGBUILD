# Maintainer: João Freitas <joaj.freitas@gmail.com>

pkgname=lichtblick-bin
pkgver=1.10.0
pkgrel=1
pkgdesc='Lichtblick is an integrated visualization and diagnosis tool for robotics, available in your browser or as a desktop app on Linux, Windows, and macOS.'
arch=('x86_64' 'aarch64')
license=('MPL')
url='https://github.com/Lichtblick-Suite/lichtblick'
depends=()
optdepends=()
provides=('lichtblick')
conflicts=('lichtblick')

source_x86_64=("$pkgname-$pkgver-x86_64.deb::https://github.com/Lichtblick-Suite/lichtblick/releases/download/v1.10.0/lichtblick-1.10.0-linux-amd64.deb")
sha256sums_x86_64=('dc6d18b1b31254edd1b4f7d8a5b2361b579515f56557012d1852b576b7e77c6c')

package() {
    tar -xf "$srcdir/data.tar.xz" -C "$pkgdir"

    install -Dm644 "$pkgdir/usr/share/icons/hicolor/512x512/apps/lichtblick.png" "$pkgdir/usr/share/pixmaps/lichtblick.png"

    ## Symlink binary which is located in /opt
    mkdir -p "$pkgdir/usr/bin"
    ln -sf "$pkgdir/opt/Lichtblick/lichtblick" "$pkgdir/usr/bin/lichtblick"
}

