# Maintainer: João Freitas <joaj.freitas@gmail.com>
# Contributor: Sven Karsten Greiner <sven@sammyshp.de>

pkgname=lichtblick-bin
pkgver=1.22.0
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
source_aarch64=("$pkgname-$pkgver-
aarch64.deb::https://github.com/lichtblick-suite/lichtblick/releases/download/v$pkgver/lichtblick-$pkgver-linux-arm64.deb")

package() {
    tar -xf "$srcdir/data.tar.xz" -C "$pkgdir"

    install -Dm644 "$pkgdir/usr/share/icons/hicolor/512x512/apps/lichtblick.png" "$pkgdir/usr/share/pixmaps/lichtblick.png"

    ## Symlink binary which is located in /opt
    mkdir -p "$pkgdir/usr/bin"
    ln -sf "$pkgdir/opt/Lichtblick/lichtblick" "$pkgdir/usr/bin/lichtblick"
}

sha256sums_x86_64=('037a44c7b8c50b167ec1a23afcdc7a6c9a3d70f92b1c569734ec4704ff13a86b')
sha256sums_aarch64=('\f8cc250f9cf5732bf0ac786ea602113deb40dc3310e577784c0cf1426efcc9dd')
