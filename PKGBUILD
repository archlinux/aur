# Maintainer: flaviofearn <heroicgameslauncher@protonmail.com>
# Maintainer: CommandMC <kate@commandmc.de>

pkgname=heroic-games-launcher-bin
pkgver=2.22.2
pkgrel=1
pkgdesc="An Open source Launcher for Epic, Amazon and GOG Games"
arch=('x86_64')
url="https://heroicgameslauncher.com/"
license=('GPL-3.0-only')
_filename=Heroic-2.22.2-linux-x64.pacman
source=("https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher/releases/download/v2.22.2/Heroic-2.22.2-linux-x64.pacman")
noextract=("Heroic-2.22.2-linux-x64.pacman")
sha256sums=(4e4033ac70b8c407eaf70ce072e4e4d017200f07a3e88f7cfd4d3a597f3c09b8)
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

