# Maintainer: Robert Cegliński <rob.ceglinski@gmail.com>
# Maintainer: gileri <aur@linuxw.info>

pkgname=luanti-voxelibre
conflicts=('minetest-mineclone2' 'minetest-voxelibre')
replaces=('minetest-mineclone2' 'minetest-voxelibre')
pkgver=0.89.0
pkgrel=1
pkgdesc='VoxeLibre (formerly known as MineClone2), a voxel-based sandbox game for Luanti'
arch=('any')
url='https://git.minetest.land/VoxeLibre/VoxeLibre'
license=('GPL3')
depends=('luanti-common')
source=("voxelibre-$pkgver.tar.gz::https://git.minetest.land/VoxeLibre/VoxeLibre/archive/${pkgver}.tar.gz")
sha256sums=('69883c314b7da94c83a87b23d822dfa02e3310d526e47cec661804451b1d4f5d')
sha512sums=('3b2f699662e43b28cb42b80b7bb024e01f0ac4917994c93835f10869f457e2bc11f47e937e2ec0d6cd85be798681cbf04c304d7e2c203f6fe0791d0388c696a4')
b2sums=('1081936f275b40f64fd00ed7ce3361bc260a941e1460ce39ae46c07610f40d6fed518b1b141a7064e343a587d2fc1750f49c7132e9342edcec96f289e3e0c22e')

package() {
  cd voxelibre

  for f in $(find . -type f); do
    install -Dm644 "$f" "$pkgdir/usr/share/luanti/games/voxelibre/$f"
  done
}
