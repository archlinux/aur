# Maintainer: Jhyub <jhyub06 at gmail dot com>

pkgname='kdeplasma-applets-supergfxctl'
pkgver=0.1.0
pkgrel=1
pkgdesc="KDE Plasma plasmoid for supergfxctl"
arch=('x86_64')
url="https://gitlab.com/Jhyub/supergfxctl-plasmoid"
license=('MPL2')
depends=('plasma-framework' 'hicolor-icon-theme' 'supergfxctl')
makedepends=('cmake')
source=(
    "https://gitlab.com/Jhyub/supergfxctl-plasmoid/-/archive/v0.1.0/supergfxctl-plasmoid-v$pkgver.tar.gz"
)
sha256sums=(
    '5f38f5bd17cb912da22dbb2c4d8c5d89e2a089248bb21f4a5fa84dd1c15cd9b1'
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
