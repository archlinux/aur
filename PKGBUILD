# Maintainer: João Freitas <joaj.freitas@gmail.com>

pkgname=lichtblick-bin
pkgver=1.14.0
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
sha256sums=('be5aebd7969c712cb50ceff54b7a0b324b2dfa08283dd5301abfd113eeaca67f')

package() {
    tar -xf "$srcdir/data.tar.xz" -C "$pkgdir"

    install -Dm644 "$pkgdir/usr/share/icons/hicolor/512x512/apps/lichtblick.png" "$pkgdir/usr/share/pixmaps/lichtblick.png"

    ## Symlink binary which is located in /opt
    mkdir -p "$pkgdir/usr/bin"
    ln -sf "$pkgdir/opt/Lichtblick/lichtblick" "$pkgdir/usr/bin/lichtblick"
}

