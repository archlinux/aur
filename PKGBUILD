# Maintainer: flaviofearn <heroicgameslauncher@protonmail.com>
# Maintainer: CommandMC <kate@commandmc.de>

pkgname=heroic-games-launcher-bin
pkgver=2.22.0
pkgrel=1
pkgdesc="An Open source Launcher for Epic, Amazon and GOG Games"
arch=('x86_64')
url="https://heroicgameslauncher.com/"
license=('GPL-3.0-only')
_filename=Heroic-2.22.0-linux-x64.pacman
source=("https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher/releases/download/v2.22.0/Heroic-2.22.0-linux-x64.pacman")
noextract=("Heroic-2.22.0-linux-x64.pacman")
sha256sums=(584164ee945826251c2174ee83e37869465f5d0463b01f757b27e4da8cd903de)
options=(!strip)
depends=(
  which
  gtk3
)
provides=(heroic-games-launcher)
conflicts=(heroic-games-launcher)

package() {
  tar -xJv -C "$pkgdir" -f "$srcdir/$_filename" usr opt
  mkdir "$pkgdir/usr/bin"
  ln -s "/opt/Heroic/heroic" "$pkgdir/usr/bin/heroic"
}

# vim:set ts=2 sw=2 et: syntax=sh

