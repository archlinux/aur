# Maintainer: João Freitas <joaj.freitas@gmail.com>

pkgname=lichtblick-bin
pkgver=1.18.0
pkgrel=1
pkgdesc='Lichtblick is an integrated visualization and diagnosis tool for robotics, available in your browser or as a desktop app on Linux, Windows, and macOS.'
arch=('x86_64' 'aarch64')
license=('MPL')
url='https://github.com/Lichtblick-Suite/lichtblick'
depends=()
optdepends=()
provides=('lichtblick')
conflicts=('lichtblick')

source=("$pkgname-$pkgver-x86_64.deb::https://github.com/lichtblick-suite/lichtblick/releases/download/v$pkgver/lichtblick-$pkgver-linux-amd64.deb")

package() {
    tar -xf "$srcdir/data.tar.xz" -C "$pkgdir"

    install -Dm644 "$pkgdir/usr/share/icons/hicolor/512x512/apps/lichtblick.png" "$pkgdir/usr/share/pixmaps/lichtblick.png"

    ## Symlink binary which is located in /opt
    mkdir -p "$pkgdir/usr/bin"
    ln -sf "$pkgdir/opt/Lichtblick/lichtblick" "$pkgdir/usr/bin/lichtblick"
}

sha256sums=('a2ac55dc1cd23d3d3a5d939ce44429acd6c78acf2d619933b7d57128ae3dc08a')
sha256sums=('0caa8bd62029bd71d0c7dcbef37d4d13068a378b0c55dd60693a0bdd35466386')
