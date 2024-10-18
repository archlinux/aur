# Maintainer: Adam Perkowski <adas1per@protonmail.com>
_pkgname='hyprwall'
pkgname='hyprwall-bin'
pkgver=0.1.2
pkgrel=1
pkgdesc='GUI for setting wallpapers with Hyprpaper, written in blazingly fast Rust!'
arch=('x86_64')
url="https://github.com/nnyyxxxx/$_pkgname"
license=('GPL-2.0')
source=("https://github.com/nnyyxxxx/$_pkgname/releases/download/v$pkgver/$_pkgname"
    "https://raw.githubusercontent.com/nnyyxxxx/$_pkgname/refs/tags/v$pkgver/$_pkgname.desktop")
sha256sums=('56e44097d1e01c1d75a66a24eeb3d70f24ffa43aa373f829c8a17ae48ee82c7e' 'SKIP')
depends=('glibc' 'gcc-libs' 'gtk4' 'hyprpaper')
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
