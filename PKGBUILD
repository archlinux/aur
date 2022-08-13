# Maintainer: Aditya Mishra <https://github.com/pegvin/goxel2/issues>
pkgname=csprite-bin
pkgver=1.0.0
pkgrel=1 # Update if you changed something but that is so minor change you don't want to change the version
pkgdesc="a tiny pixel art editor"
arch=('i686' 'x86_64')
url="https://github.com/pegvin/csprite"
license=('MIT')
depends=(glfw gtk3)
provides=('csprite-bin')
conflicts=('csprite' 'csprite-git' 'csprite-bin')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pegvin/csprite/archive/refs/tags/v${pkgver}.tar.gz")
source_x86_64=(${pkgname}-${pkgver}.elf::https://github.com/pegvin/csprite/releases/download/v${pkgver}/csprite-x86_64.elf)
#source_i686=(${pkgname}-${pkgver}.elf::https://github.com/pegvin/csprite/releases/download/v${pkgver}/csprite-i686.elf)

sha512sums=(85c09a15ab1ebca8210aee6481b23b9262bada2e70173ed058f56cbde9857c7220e16d0200da433093f76e2c9c64441d401913fb24e488c179c9af0881836f47)
sha512sums_x86_64=(36283d518706a3981e3c946b23e868b9b8f82d5da58d65dc62da6c3319e1d56720bc90dd5c8685064049b71d5a9b1ebb0117f9fefc1021ca02a939b2a618a96d)
#sha512sums_i686=(__BINARY_I686_SUMS__)

package() {
	install -Dm644 csprite-${pkgver}/data/csprite.desktop "$pkgdir/usr/share/applications/csprite.desktop"
	install -Dm644 csprite-${pkgver}/icon.png "$pkgdir/usr/share/icons/csprite.png"
	install -Dm755 ${pkgname}-${pkgver}.elf "$pkgdir/usr/bin/csprite"
}
