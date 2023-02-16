# Maintainer: Miquel Lionel <lionel@les-miquelots.net>
pkgname=ultrakill-demo
pkgver=104c
pkgrel=1
pkgdesc="ULTRAKILL video game demo."
url="https://hakita.itch.io/ultrakill-prelude"
arch=('x86_64')
license=('GPL3')
depends=('mesa' 'glu' 'xorg-server' 'xorg-server-common' 'xorg-xinit')
optdepends=('xorg-xwayland: play the game when on a wayland compositor' 'firejail: launch game with --net=none to block telemetry to Unity servers.')
conflicts=("$pkgname")
provides=("$pkgname")
source=("$pkgname-$pkgver.zip::https://archive.org/download/ultrakill-prelude-v-104c-linux/ULTRAKILL%20Prelude%20v$pkgver%20Linux.zip")
sha256sums=('9aacc46106b6e3a9d7ea22fe43d3eb1368d6027cc88d0c85d8a6e34fa26a1171')
install="$pkgname.install"

package() {
  GAMEDIR="$pkgdir/usr/share/games/ultrakill-demo"
  BINDIR="usr/local/bin"
  mkdir -p $GAMEDIR
  mkdir -p $pkgdir/$BINDIR
  cp -r  "$srcdir"/* $GAMEDIR/
  rm -f $GAMEDIR/*.zip
  chmod +x "$GAMEDIR/Linux Test Build.x86_64"
  cp ../ultrakill-demo $pkgdir/$BINDIR
}
