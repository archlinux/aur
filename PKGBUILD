# Maintainer: Jhyub <jhyub06 at gmail dot com>

pkgname='plasma6-applets-supergfxctl'
pkgver=2.1.1
pkgrel=1
pkgdesc="KDE Plasma plasmoid for supergfxctl"
arch=('x86_64')
url="https://gitlab.com/Jhyub/supergfxctl-plasmoid"
license=('MPL-2.0')
depends=('hicolor-icon-theme' 'glibc' 'kcoreaddons' 'kconfig' 'ki18n' 'kirigami' 'ksvg' 'libplasma' 'qt6-base' 'qt6-declarative' 'solid' 'gcc-libs' 'supergfxctl')
makedepends=('cmake' 'extra-cmake-modules')
conflicts=('plasma5-applets-supergfxctl')
source=(
    "https://gitlab.com/Jhyub/supergfxctl-plasmoid/-/archive/v$pkgver/supergfxctl-plasmoid-v$pkgver.tar.gz"
)
sha256sums=(
    'eb7b9e28bc3786abeaea9f4ae565b701033b0a58ded0d9f8e28f7ea2063b00fa'
)

build() {
	cd "supergfxctl-plasmoid-v$pkgver"
	mkdir -p build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_WITH_QT6=ON ..
	make
}

package() {
	cd "supergfxctl-plasmoid-v$pkgver/build"
	make DESTDIR="${pkgdir}/" install
}
