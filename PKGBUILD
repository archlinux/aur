# Maintainer: Danil Yarantsev <tiberiumk12 at gmail dot com>
pkgname=doom2df-bin-git
pkgver=185
pkgrel=1
pkgdesc="Doom 2D Forever: A Doom 2D remake with multiplayer"
arch=(x86_64)
url="http://doom2d.org/"
license=('GPL3')
depends=(sdl2_mixer sdl2 enet libgl)
conflicts=(doom2df-git)
source=(
  'https://deadsoftware.ru/files/deaddoomer/d2df/win32-d2df-latest.zip'
  'https://deadsoftware.ru/files/deaddoomer/d2df/linux-amd64-d2df-latest-bin.zip'
  'https://deadsoftware.ru/files/deaddoomer/d2df/linux-amd64-d2df-latest-version.txt'
  'doom2df.desktop'
  'doom2df.png'
)
md5sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'a529aca738b79f2099fcef6e583fbed3'
  '191cd29a6994ab257abf6c0b1060b2fd'
)

pkgver() {
  printf "$(cat linux-amd64-d2df-latest-version.txt | cut -d' ' -f1)"
}

package() {
  cd "${srcdir}"
  install -Dm755 Doom2DF "${pkgdir}"/usr/bin/Doom2DF
  install -Dm644 doom2df.desktop "${pkgdir}"/usr/share/applications/doom2df.desktop
  install -Dm644 doom2df.png "${pkgdir}"/usr/share/pixmaps/doom2df.png
  mkdir -p "${pkgdir}"/usr/share/doom2df
  cp -r data maps wads "${pkgdir}"/usr/share/doom2df/
}
