# Maintainer: Jhyub <jhyub06 at gmail dot com>

pkgname='kdeplasma-applets-supergfxctl'
pkgver=0.2.0
pkgrel=1
pkgdesc="KDE Plasma plasmoid for supergfxctl"
arch=('x86_64')
url="https://gitlab.com/Jhyub/supergfxctl-plasmoid"
license=('MPL2')
depends=('plasma-framework' 'hicolor-icon-theme' 'supergfxctl')
makedepends=('cmake' 'extra-cmake-modules')
source=(
    "https://gitlab.com/Jhyub/supergfxctl-plasmoid/-/archive/v$pkgver/supergfxctl-plasmoid-v$pkgver.tar.gz"
)
sha256sums=(
    '63e937a0c64ea31c79ef8ca29b9a7a83fef0db4d81c22bcad02c4c6847f114d1'
)

build() {
	cd "supergfxctl-plasmoid-v$pkgver"
	mkdir -p build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	cd "supergfxctl-plasmoid-v$pkgver/build"
	make DESTDIR="${pkgdir}/" install
}
