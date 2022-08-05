# Maintainer: Aditya Mishra <https://github.com/pegvin/goxel2/issues>
pkgname=goxel2
pkgver=0.14.2
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
	d8fac1a3628fbd42712d25e7c2e9f5873071caba7104ffce3e28bb34789ff7dcee31909c738b4009746d00b0635985ad91f916c935878fc01c1a81f7db1a11a1
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
