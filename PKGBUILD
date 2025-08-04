# Maintainer: Robert Cegliński <rob.ceglinski@gmail.com>
# Maintainer: gileri <aur@linuxw.info>

pkgname=luanti-voxelibre
conflicts=('minetest-mineclone2' 'minetest-voxelibre')
replaces=('minetest-mineclone2' 'minetest-voxelibre')
pkgver=0.90.0
pkgrel=1
pkgdesc='VoxeLibre (formerly known as MineClone2), a voxel-based sandbox game for Luanti'
arch=('any')
url='https://git.minetest.land/VoxeLibre/VoxeLibre'
license=('GPL3')
depends=('luanti-common')
source=("voxelibre-$pkgver.tar.gz::https://git.minetest.land/VoxeLibre/VoxeLibre/archive/${pkgver}.tar.gz")
sha256sums=('1247a7dfcb47002d98019ad6c2e603af62f041f5476c45cd0b3365cd407ff006')
sha512sums=('0b65c7c268c1ef9ac29e738a4a70c90122ced96dde2834f7cd8faafaf7daba578c14d7ff0020dc155bbc390bc401b3a19870f66a21603db3253cc03e3fda64af')
b2sums=('2ce70311e7eeb1a8377dd806e5271721302551c0d2374cad844dd73a98bfa5522d28e33d988847521f555bbd4779990b66024b93f55e2f1bb2719454553d03ed')

package() {
  cd voxelibre

  for f in $(find . -type f); do
    install -Dm644 "$f" "$pkgdir/usr/share/luanti/games/voxelibre/$f"
  done
}
