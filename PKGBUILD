# Maintainer: flaviofearn <heroicgameslauncher@protonmail.com>
# Maintainer: CommandMC <kate@commandmc.de>

pkgver=2.22.2
pkgrel=2
sha256sums=('4e4033ac70b8c407eaf70ce072e4e4d017200f07a3e88f7cfd4d3a597f3c09b8')

pkgname=heroic-games-launcher-bin
pkgdesc="An Open Source Launcher for GOG, Epic Games and Amazon Games"
arch=('x86_64')
url="https://heroicgameslauncher.com/"
license=('GPL-3.0-only')
source=("https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher/releases/download/v${pkgver}/Heroic-${pkgver}-linux-x64.pacman")
noextract=("${source[@]##*/}")
depends=(
  "which"

  # Electron dependencies
  "gtk3"
  "nss"
  "alsa-lib"
  "libcups"
  "nspr"
  "at-spi2-core"

  # Required by some helper binaries
  "python"
  "libgcc"
  "glibc"
  "zlib-ng-compat"
)
optdepends=(
  "gamemode"
  "gamescope"
  "mangohud"
)
provides=(heroic-games-launcher)
conflicts=(heroic-games-launcher)

package() {
  tar --extract --xz --directory="$pkgdir" --file="$srcdir/Heroic-${pkgver}-linux-x64.pacman" usr opt
  mkdir "$pkgdir/usr/bin"
  ln -s "/opt/Heroic/heroic" "$pkgdir/usr/bin/heroic"
}
