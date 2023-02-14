# Maintainer:  ROllerozxa <rollerozxa@voxelmanip.se>
pkgname=minetest-devtest-git
pkgver=5.6.0.r314.g4cd6b773b
pkgrel=1
pkgdesc='Minetest Development Test game (git version, -dev)'
url='https://www.minetest.net/'
license=('GPL')
arch=('any')
makedepends=('git')
depends=('minetest-common')
source=('git+https://github.com/minetest/minetest.git')
sha1sums=('SKIP')

conflicts=("minetest-devtest")
provides=("minetest-devtest")

pkgver() {
	git -C "minetest" describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	mkdir -p "${pkgdir}/usr/share/minetest/games/"
	cp -a "${srcdir}/minetest/games/devtest" "${pkgdir}/usr/share/minetest/games/"
}
