# Maintainer: Aditya Mishra <https://github.com/pegvin/goxel2/issues>
pkgname=goxel2-bin
pkgver=0.15.0
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

sha512sums=(ab5862c51e67a20ab73cadac8236900ce7f64cdbd92952b0ea8bf7c5c1815d730ebc6cfc339c5fdab4ef6063d87902f01d8d10ff1fbe27acb6e80f8dc98cb957)
sha512sums_x86_64=(0d72454452c082675ea3c0e8370529c6c4e22ce4f0f768fab93a37274e09aba117c7922d4e718360eb445aa6c1b717b7b2be60677f995f9099823611c1d7baf5)
sha512sums_i686=(1b15dc5771012c4b27a343edec25e9ed01d878698ee862833edb66a2c17b2e5538dc36690657ef89600830cd6a038eb7d911b56b4b69050fd4f5b10575800a34)

package() {
	install -Dm644 goxel2-${pkgver}/data/goxel2.desktop "$pkgdir/usr/share/applications/goxel2.desktop"
	install -Dm644 goxel2-${pkgver}/icon.png "$pkgdir/usr/share/icons/goxel2.png"
	install -Dm755 ${pkgname}-${pkgver}.elf "$pkgdir/usr/bin/goxel2"
}
