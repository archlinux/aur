# Maintainer: Jhyub <jhyub06 at gmail dot com>

pkgname='plasma5-applets-supergfxctl'
pkgver=1.3.1
pkgrel=1
pkgdesc="KDE Plasma plasmoid for supergfxctl"
arch=('x86_64')
url="https://gitlab.com/Jhyub/supergfxctl-plasmoid"
license=('MPL2')
depends=('plasma-framework5' 'hicolor-icon-theme' 'glibc' 'ki18n5' 'kcoreaddons5' 'qt5-base' 'qt5-declarative' 'gcc-libs' 'supergfxctl>=5.1.0')
makedepends=('cmake' 'extra-cmake-modules')
source=(
    "https://gitlab.com/Jhyub/supergfxctl-plasmoid/-/archive/v$pkgver/supergfxctl-plasmoid-v$pkgver.tar.gz"
)
sha256sums=(
    'c568923045af6ab31e4d52020cc0bbd4e3a88f79b10724a2b96d060d446cfd38'
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
