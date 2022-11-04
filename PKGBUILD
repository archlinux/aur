# Maintainer: Jhyub <jhyub06 at gmail dot com>

pkgname='plasma5-applets-supergfxctl'
pkgver=1.2.0
pkgrel=2
pkgdesc="KDE Plasma plasmoid for supergfxctl"
arch=('x86_64')
url="https://gitlab.com/Jhyub/supergfxctl-plasmoid"
license=('MPL2')
depends=('plasma-framework' 'hicolor-icon-theme' 'supergfxctl>=5.0.1')
makedepends=('cmake' 'extra-cmake-modules')
source=(
    "https://gitlab.com/Jhyub/supergfxctl-plasmoid/-/archive/v$pkgver/supergfxctl-plasmoid-v$pkgver.tar.gz"
)
sha256sums=(
    '6996d4aa2f64fe9b417120fcb430c45a529b441ffa63035c880691d6f72c852e'
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
