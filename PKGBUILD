# Maintainer: Adam Perkowski <adas1per@protonmail.com>
_pkgname='hyprgui'
pkgname='hyprgui-bin'
pkgver=0.1.3
pkgrel=1
pkgdesc='GUI for configuring Hyprland, written in blazingly fast Rust!'
arch=('x86_64')
url='https://github.com/nnyyxxxx/hyprgui'
license=('GPL-2.0')
source=("https://github.com/nnyyxxxx/$_pkgname/releases/download/v$pkgver/$_pkgname"
    "https://raw.githubusercontent.com/nnyyxxxx/$_pkgname/refs/tags/v$pkgver/$_pkgname.desktop")
sha256sums=('f559e72ff9a288a80be92b2daec59365cedc8779cf4bdab304c272f9f5ceeab5' 'SKIP')
depends=('glibc' 'gcc-libs' 'gtk4')
optdepends=('hyprland')
conflicts=($_pkgname)
provides=($_pkgname)

prepare() {
    echo "Version=$pkgver" >> "$pkgname.desktop"
}

package() {
    cd "$srcdir"

    install -Dm0755 -t "$pkgdir/usr/bin/" "$_pkgname"
    install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
