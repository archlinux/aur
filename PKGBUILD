# Maintainer: flaviofearn <flavioislima@gmail.com>

pkgname=heroic-games-launcher-bin
pkgver=2.19.1
pkgrel=1
pkgdesc="An Open source Launcher for Epic, Amazon and GOG Games"
arch=('x86_64')
url="https://heroicgameslauncher.com/"
license=('GPL-3.0-only')
_filename=Heroic-2.19.1-linux-x64.pacman
source=("https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher/releases/download/v2.19.1/Heroic-2.19.1-linux-x64.pacman")
noextract=("Heroic-2.19.1-linux-x64.pacman")
sha256sums=(2035d47afa9c286900b3e781588903d6a57dcc8b0ad32aa27835fec53b43e5bc)
options=(!strip)
depends=(which)
provides=(heroic-games-launcher)
conflicts=(heroic-games-launcher)

package() {
  tar -xJv -C "$pkgdir" -f "$srcdir/$_filename" usr opt
  mkdir "$pkgdir/usr/bin"
  ln -s "/opt/Heroic/heroic" "$pkgdir/usr/bin/heroic"
}

# vim:set ts=2 sw=2 et: syntax=sh

