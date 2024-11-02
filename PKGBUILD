# Maintainer: Adam Perkowski <adas1per@protonmail.com>
_pkgname='hyprgui'
pkgname='hyprgui-bin'
pkgver=0.1.7
pkgrel=2
pkgdesc='GUI for configuring Hyprland, written in blazingly fast Rust!'
arch=('x86_64')
url='https://github.com/nnyyxxxx/hyprgui'
license=('GPL-2.0')
source=("$_pkgname-$pkgver::https://github.com/nnyyxxxx/$_pkgname/releases/download/v$pkgver/$_pkgname"
    "https://raw.githubusercontent.com/nnyyxxxx/$_pkgname/refs/tags/v$pkgver/$_pkgname.desktop"
    "https://raw.githubusercontent.com/nnyyxxxx/$_pkgname/refs/tags/v$pkgver/$_pkgname.png")
sha256sums=('3f7990c010393dd58481cc339b728d741beca5d61973498bde0223982759e6e4' 'SKIP' 'SKIP')
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
