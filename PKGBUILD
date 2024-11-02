# Maintainer: Adam Perkowski <adas1per@protonmail.com>
_pkgname='hyprgui'
pkgname='hyprgui-bin'
pkgver=0.1.7
pkgrel=1
pkgdesc='GUI for configuring Hyprland, written in blazingly fast Rust!'
arch=('x86_64')
url='https://github.com/nnyyxxxx/hyprgui'
license=('GPL-2.0')
source=("$_pkgname-$pkgver::https://github.com/nnyyxxxx/$_pkgname/releases/download/v$pkgver/$_pkgname"
    "https://raw.githubusercontent.com/nnyyxxxx/$_pkgname/refs/tags/v$pkgver/$_pkgname.desktop"
    "https://raw.githubusercontent.com/nnyyxxxx/$_pkgname/refs/tags/v$pkgver/$_pkgname.png")
sha256sums=('c307efcecb3122dc9b7b617d47bf350adee01711f8d0e1822305fd4b34d5d3ab' 'SKIP' 'SKIP')
depends=('glibc' 'gcc-libs' 'gtk4')
optdepends=('hyprland')
conflicts=($_pkgname)
provides=($_pkgname)

prepare() {
    echo "Version=$pkgver" >> "$pkgname.desktop"
}

package() {
    cd "$srcdir"

    install -Dm0755 "$_pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "$_pkgname.png" "$pkgdir/usr/share/icons/$_pkgname.png"
    install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
