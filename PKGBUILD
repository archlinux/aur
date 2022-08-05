# Maintainer: Aditya Mishra <https://github.com/pegvin/goxel2/issues>
pkgname=goxel2
pkgver=0.15.0
pkgrel=3 # Update if you changed something but that is so minor change you don't want to change the version
pkgdesc="a cross-platform 3d voxel art editor"
arch=('i686' 'x86_64')
url="https://github.com/pegvin/goxel2"
license=('GPL3')
depends=(glfw gtk3)
makedepends=(git make tar curl scons pkg-config)
optdepends=()
provides=('goxel2')
conflicts=('goxel2' 'goxel2-git' 'goxel2-bin')

source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/pegvin/goxel2/archive/refs/tags/v${pkgver}.tar.gz"
)

sha512sums=(
	ab5862c51e67a20ab73cadac8236900ce7f64cdbd92952b0ea8bf7c5c1815d730ebc6cfc339c5fdab4ef6063d87902f01d8d10ff1fbe27acb6e80f8dc98cb957
)

build() {
    cd "goxel2-${pkgver}"
	make release
}

package() {
    cd "goxel2-${pkgver}"
	install -Dm644 data/goxel2.desktop "$pkgdir/usr/share/applications/goxel2.desktop"
	install -Dm644 icon.png "$pkgdir/usr/share/icons/goxel2.png"
	install -Dm755 goxel2 "$pkgdir/usr/bin/goxel2"
}
