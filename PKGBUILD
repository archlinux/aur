# Maintainer: Robert Cegliński <rob.ceglinski@gmail.com>
# Maintainer: gileri <aur@linuxw.info>

pkgname=luanti-voxelibre
conflicts=('minetest-mineclone2' 'minetest-voxelibre')
replaces=('minetest-mineclone2' 'minetest-voxelibre')
pkgver=0.91.2
pkgrel=1
pkgdesc='VoxeLibre (formerly known as MineClone2), a voxel-based sandbox game for Luanti'
arch=('any')
url='https://git.minetest.land/VoxeLibre/VoxeLibre'
license=('GPL3')
depends=('luanti-common')
source=("voxelibre::git+https://git.minetest.land/VoxeLibre/VoxeLibre.git#tag=${pkgver}")
sha256sums=('SKIP')

package() {
  cd voxelibre

  for f in $(find . -type f); do
    install -Dm644 "$f" "$pkgdir/usr/share/luanti/games/voxelibre/$f"
  done
}
