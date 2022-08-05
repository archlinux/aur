# Maintainer: Aditya Mishra <https://github.com/pegvin/goxel2/issues>
pkgname=goxel2-bin
pkgver=0.14.2
pkgrel=3 # Update if you changed something but that is so minor change you don't want to change the version
pkgdesc="a cross-platform 3d voxel art editor"
arch=('i686' 'x86_64')
url="https://github.com/pegvin/goxel2"
license=('GPL3')
depends=(glfw gtk3)
provides=('goxel2-bin')
conflicts=('goxel2' 'goxel2-git' 'goxel2-bin')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pegvin/goxel2/archive/refs/tags/v${pkgver}.tar.gz")
source_x86_64=(${pkgname}-${pkgver}.elf::https://github.com/goxel2/goxel2/releases/download/v${pkgver}/goxel2-x86_64.elf)
source_i686=(${pkgname}-${pkgver}.elf::https://github.com/goxel2/goxel2/releases/download/v${pkgver}/goxel2-i686.elf)

sha512sums=(d8fac1a3628fbd42712d25e7c2e9f5873071caba7104ffce3e28bb34789ff7dcee31909c738b4009746d00b0635985ad91f916c935878fc01c1a81f7db1a11a1)
sha512sums_x86_64=(e5dfe48b10e3af64e968daf761f1890153c3da69a250e6fb4b23af2b3b7e2a3e97dfc575d70cb2478f17e410a03db2b3bb04d1fd909c553858f2bee02abfb81e)
sha512sums_i686=(4544bb134af244eb36f9317db361c5cab27b169f993f5bf76e5a6f4061f192c6c1b03dc11e26e646ba03b7646e48803a0ad063f2c88e5d7ae9a4395b9f0473cb)

package() {
	install -Dm644 goxel2-${pkgver}/data/goxel2.desktop "$pkgdir/usr/share/applications/goxel2.desktop"
	install -Dm644 goxel2-${pkgver}/icon.png "$pkgdir/usr/share/icons/goxel2.png"
	install -Dm755 ${pkgname}-${pkgver}.elf "$pkgdir/usr/bin/goxel2"
}
