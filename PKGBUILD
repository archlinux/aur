# Maintainer: Hsiu-Ming Chang <cges30901 at gmail dot com>
pkgname=hmtimer
pkgver=2.5
pkgrel=1
pkgdesc="graphical shutdown timer"
arch=('i686' 'x86_64')
url="https://hsiumingstimer.sourceforge.io/"
license=('GPL3')
groups=()
depends=('qt5-base' 'qt5-multimedia' 'hicolor-icon-theme')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install="$pkgname.install"
changelog=
source=("https://sourceforge.net/projects/hsiumingstimer/files/hmtimer-$pkgver/hmtimer-$pkgver-src.tar.bz2")
noextract=()
md5sums=('9e5b4460d28ae9b12cb0e5a11d8c8579')

build() {
  cd "$pkgname-$pkgver"
  qmake
  make
  gzip hmtimer.1
}

package() {
  cd "$pkgname-$pkgver"

  install -D -m0755 src/hmtimer $pkgdir/usr/bin/hmtimer
  install -D -m0644 -t $pkgdir/usr/share/hmtimer src/language/hmtimer_*.qm
  install -D -m0644 hmtimer.desktop $pkgdir/usr/share/applications/hmtimer.desktop
  install -D -m0644 src/hmtimer.png $pkgdir/usr/share/icons/hicolor/128x128/apps/hmtimer.png
  install -D -m0644 src/hmtimer48.png $pkgdir/usr/share/icons/hicolor/48x48/apps/hmtimer.png
  install -D -m0644 hmtimer.1.gz $pkgdir/usr/share/man/man1/hmtimer.1.gz
}
