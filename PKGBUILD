# Maintainer: João Freitas <joaj.freitas@gmail.com>
# Contributor: Sven Karsten Greiner <sven@sammyshp.de>

pkgname=lichtblick-bin
pkgver=1.25.0
pkgrel=1
pkgdesc='Integrated visualization and diagnosis tool for robotics'
arch=('x86_64' 'aarch64')
license=('MPL-2.0')
url='https://github.com/Lichtblick-Suite/lichtblick'
depends=(
    'alsa-lib'
    'at-spi2-core'
    'cairo'
    'dbus'
    'expat'
    'gcc-libs'
    'glib2'
    'glibc'
    'gtk3'
    'hicolor-icon-theme'
    'libcups'
    'libx11'
    'libxcb'
    'libxcomposite'
    'libxdamage'
    'libxext'
    'libxfixes'
    'libxkbcommon'
    'libxrandr'
    'mesa'
    'nspr'
    'nss'
    'pango'
    'systemd-libs'
)
optdepends=()
provides=('lichtblick')
conflicts=('lichtblick')

source_x86_64=("$pkgname-$pkgver-x86_64.deb::https://github.com/lichtblick-suite/lichtblick/releases/download/v$pkgver/lichtblick-$pkgver-linux-amd64.deb")
source_aarch64=("$pkgname-$pkgver-aarch64.deb::https://github.com/lichtblick-suite/lichtblick/releases/download/v$pkgver/lichtblick-$pkgver-linux-arm64.deb")

sha256sums_x86_64=('1af2ecb290d0d89956f88dbdc50785370c448f9c30ee8afa0a7f988f68fbee80')
sha256sums_aarch64=('b0ed9ac1b729ddf2207bc4f9727bd3af5ad804a093bcdf070d9e6b4f4111d988')

package() {
    tar -xf "$srcdir/data.tar.xz" -C "$pkgdir"

    install -Dm644 "$pkgdir/usr/share/icons/hicolor/512x512/apps/lichtblick.png" "$pkgdir/usr/share/pixmaps/lichtblick.png"

    mkdir -p "$pkgdir/usr/bin"
    ln -s "/opt/Lichtblick/lichtblick" "$pkgdir/usr/bin/lichtblick"
}
