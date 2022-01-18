# Maintainer: Jhyub <jhyub06 at gmail dot com>

pkgname='kdeplasma-applets-supergfxctl'
pkgver=0.4.0
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
    'ad0e414129fb2a24c2779a60a75a83d6189ae23d0a4595de223c657e15615f19'
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
