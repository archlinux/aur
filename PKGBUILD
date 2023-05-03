# Maintainer: Jhyub <jhyub06 at gmail dot com>

pkgname='plasma5-applets-supergfxctl'
pkgver=1.3.0
pkgrel=1
pkgdesc="KDE Plasma plasmoid for supergfxctl"
arch=('x86_64')
url="https://gitlab.com/Jhyub/supergfxctl-plasmoid"
license=('MPL2')
depends=('plasma-framework' 'hicolor-icon-theme' 'glibc' 'ki18n' 'kcoreaddons' 'qt5-base' 'qt5-declarative' 'gcc-libs' 'supergfxctl>=5.1.0')
makedepends=('cmake' 'extra-cmake-modules')
source=(
    "https://gitlab.com/Jhyub/supergfxctl-plasmoid/-/archive/v$pkgver/supergfxctl-plasmoid-v$pkgver.tar.gz"
)
sha256sums=(
    'ef68eecb4d17d72be918f84515a68480c7e30f0c8e46d1610d46e722837eab9b'
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
