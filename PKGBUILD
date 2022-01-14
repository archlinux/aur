# Maintainer: Jhyub <jhyub06 at gmail dot com>

pkgname='kdeplasma-applets-supergfxctl'
pkgver=0.3.0
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
    '20a94fdee0e1f19896346d62685e6ffd2e2125a28fdc80ea7b7e12e548b69ba8'
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
