# Maintainer: NotRx <toby@soupcan.xyz>

pkgname=polytrack
pkgver=0.5.2
pkgrel=2
pkgdesc="An Unofficial Community Made AUR Package"
arch=('x86_64')
url="https://github.com/SoupcanUBG/polytrack"
license=('unknown')
makedepends=('git')
provides=("$pkgname")
source=("https://github.com/SoupcanUBG/$pkgname/releases/download/Releases/PolyTrack-linux-x64.tar.gz")
sha256sums=('SKIP')






package() {

install -d "$pkgdir/usr/share/$pkgname"
tar -xzf "$srcdir/PolyTrack-linux-x64.tar.gz" -C "$pkgdir/usr/share/$pkgname"



install -d "$pkgdir/usr/share/applications"


  cat > "$pkgdir/usr/share/applications/$pkgname.desktop" <<EOF
[Desktop Entry]
Name=PolyTrack
Comment=A Racing Game
Exec=/usr/share/$pkgname/PolyTrack
Icon=/usr/share/$pkgname/icon.png
Terminal=false
Type=Application
Categories=Game;
EOF

install -Dm644 "$pkgdir/usr/share/$pkgname/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

install -Dm644 "$pkgdir/usr/share/$pkgname/icon.png" \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"


}

