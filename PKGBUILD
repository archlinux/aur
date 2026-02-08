# Maintainer: NotRx <toby@soupcan.xyz>

pkgname=polytrack
pkgver=0.5.2
pkgrel=1
pkgdesc="An Unofficial Community Made AUR Package"
arch=('x86_64')
url="https://github.com/SoupcanUBG/polytrack"
license=('unknown')
makedepends=('git')
provides=("$pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags --always | sed 's/^v/ /'
}





package() {
cd "$srcdir/$pkgname"

install -d "$pkgdir/usr/share/$pkgname"
cp -r . "$pkgdir/usr/share/$pkgname"


install -d "$pkgdir/usr/share/applications"


  cat > "$pkgdir/usr/share/applications/$pkgname.desktop" <<EOF
[Desktop Entry]
Name=PolyTrack
Comment=A Racing Game
Exec=/usr/share/PolyTrack/PolyTrack
Icon=/usr/share/PolyTrack/icon.png
Terminal=false
Type=Application
Categories=Game;
EOF
}

