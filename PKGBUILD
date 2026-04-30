# Maintainer: TTsdzb <ttsdzb at outlook dot com>

pkgname=heroic-games-launcher-proxy-bin
pkgver=2.21.0
pkgrel=1
pkgdesc="An Open source Launcher for Epic, Amazon and GOG Games. Patched for proxy envs support."
arch=('x86_64')
url="https://github.com/TTsdzb/HeroicGamesLauncher/"
license=('GPL-3.0-only')
source=("https://github.com/TTsdzb/HeroicGamesLauncher/releases/download/v${pkgver}/Heroic-${pkgver}-linux-x64.pacman")
noextract=("Heroic-${pkgver}-linux-x64.pacman")
sha256sums=(83ccc8eb3a778794630b48e8935b48c5c69d1480db96d3b1a7331186446c5bab)
options=(!strip)
depends=(
  which
  gtk3
)
provides=(heroic-games-launcher)
conflicts=(heroic-games-launcher)

package() {
  tar -xJv -C "$pkgdir" -f "$srcdir/Heroic-${pkgver}-linux-x64.pacman" usr opt
  mkdir "$pkgdir/usr/bin"
  ln -s "/opt/Heroic/heroic" "$pkgdir/usr/bin/heroic"
}

# vim:set ts=2 sw=2 et: syntax=sh
