# Maintainer: Macro-Proto
pkgname='desksaw'
pkgver=0.3.0
pkgrel=2
_filename='deskSaw030LINUX'
epoch=
pkgdesc="An interactive Desktop Pet from Casualties:Unknown"
arch=('x86_64')
url="https://github.com/dee-dee-catorce/desksaw"
license=(MIT)
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/dee-dee-catorce/$pkgname/releases/download/v$pkgver/deskSaw030LINUX.zip" "$pkgname.desktop" "newlogo.png")
noextract=()
sha256sums=('4a46273ddbe4900b96f7f3d9cddeae65fb6685f09640d9d886dd6d53a922c4d2' 'SKIP' 'SKIP')
validpgpkeys=()


package() {
    mkdir -p "$pkgdir/usr/share/$pkgname"
    cp -r ./$_filename/* "$pkgdir/usr/share/$pkgname"
    chmod +x "$pkgdir/usr/share/$pkgname/$_filename.$CARCH"
    mkdir -p "$pkgdir/bin/" && ln -s "$pkgdir/usr/share/$pkgname/$_filename.$CARCH" "$pkgdir/bin/$pkgname"
    install -Dm644 "newlogo.png" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.png"
    install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
