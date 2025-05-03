# Maintainer: Robert Cegliński <rob.ceglinski@gmail.com>
# Maintainer: gileri <aur@linuxw.info>

pkgname=luanti-voxelibre
conflicts=('minetest-mineclone2' 'minetest-voxelibre')
replaces=('minetest-mineclone2' 'minetest-voxelibre')
pkgver=0.89.1
pkgrel=1
pkgdesc='VoxeLibre (formerly known as MineClone2), a voxel-based sandbox game for Luanti'
arch=('any')
url='https://git.minetest.land/VoxeLibre/VoxeLibre'
license=('GPL3')
depends=('luanti-common')
source=("voxelibre-$pkgver.tar.gz::https://git.minetest.land/VoxeLibre/VoxeLibre/archive/${pkgver}.tar.gz")
sha256sums=('2a3b1ded4527512823bae4505bb791d230c6c36ef0e32e5701106552e1996e80')
sha512sums=('3fc358549b7da1593bb69278e620a8251fadf90a6ac598d1c644cd8f26d19ddc04a8a158ddbc99a16f28ae8fa06abfbf4f2a39728a146906b9718ff723e2212e')
b2sums=('11e1060c8a6b432da2255507f46234a8a629e60234034f7c5932d59d06f452ca78f79d600164452248cc2ce3110617138a8821be8039edb0d84f5598d7d5a526')

package() {
  cd voxelibre

  for f in $(find . -type f); do
    install -Dm644 "$f" "$pkgdir/usr/share/luanti/games/voxelibre/$f"
  done
}
