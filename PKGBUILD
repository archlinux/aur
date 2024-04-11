pkgname=rosary
pkgver=1.0.1
pkgrel=1
pkgdesc="A Simple Bible App Written in Qt"
arch=('x86_64' 'aarch64')
url="https://github.com/RoseBlume/Rosary-Bible-App"
#options=(!lto)
license=('GPL-3.0-or-later')
depends=(
  'pacman>6.1'
  'git'
  'qt6-base>=6.4'
  'qt6-declarative>=6.4'
  'qt6-webengine>=6.4'
)
optdepends=(
  'sudo: privilege elevation'
  'doas: privilege elevation'
)
source=("Rosary-$pkgver"_"$CARCH.tar.gz::https://github.com/RoseBlume/Rosary-Bible-App/releases/download/v$pkgver/Rosary-"$pkgver"_$CARCH.tar.gz")

if [ "$CARCH" = "x86_64" ]; then
	sha256sums=('8ef69788fe9d30a44abf1b25e127845250610021040b6d77f74d32f028459ecc')
elif [ "$CARCH" = "aarch64" ]; then
	sha256sums=('a38f377e0179f294e5b0c12df746fb999c40202549ae1179917b653fcd0ad25b')
fi

package() {
  cd "$srcdir/Rosary-1.0.0-Linux"
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/applications"
  install -d "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  install -m755 "$srcdir/Rosary-1.0.0-Linux/bin/Rosary" "$pkgdir/usr/bin"
  install -m755 "$srcdir/Rosary-1.0.0-Linux/share/applications/Rosary.desktop" "$pkgdir/usr/share/applications"
  install -m644 "$srcdir/Rosary-1.0.0-Linux/share/icons/hicolor/scalable/apps/bible.png" "$pkgdir/usr/share/icons/hicolor/scalable/apps/bible.png"
  cp -r "$srcdir/Rosary-1.0.0-Linux/share/rosary" "$pkgdir/usr/share/"

}
