# Maintainer: Bruce Zhang
pkgname=plasma-ions-china-git
pkgver=r74.d3d1e73
pkgrel=1
pkgdesc="A collection of plasma weather ions for Chinese users. "
arch=('x86_64')
url="https://github.com/arenekosreal/plasma-ions-china"
license=('GPL3')
depends=('qt6-base')
makedepends=('git' 'cmake' 'extra-cmake-modules' 'gettext')
optdepends=('plasma-workspace<6.5' 'kdeplasma-addons>=6.5')
provides=('plasma-ions-china')
conflicts=('plasma-ions-china')
source=('plasma-ions-china::git+https://github.com/arenekosreal/plasma-ions-china.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/plasma-ions-china"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
	cd "$srcdir/plasma-ions-china"
	cmake -B build -S . -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="$pkgdir/usr"
	cmake --build  build
}

package() {
	cd "$srcdir/plasma-ions-china"
	cmake --install build
}
