# Maintainer: katt <magunasu.b97@gmail.com>

pkgname=minetest-mineclone2-git
pkgver=0.70.0.r167.g26037157
pkgrel=1
pkgdesc='Voxel-based sandbox game for Minetest (git)'
arch=(any)
url=https://git.minetest.land/MineClone2/MineClone2
license=(GPL3)
depends=(minetest-common)
makedepends=(git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+"${url}".git)
md5sums=('SKIP')

pkgver() {
    git -C MineClone2 describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    install -d "$pkgdir/usr/share/minetest/games"
    cp -r MineClone2 "$pkgdir/usr/share/minetest/games/mineclone2"
}
