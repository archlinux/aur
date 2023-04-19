# Maintainer: Shantanu Tushar <shantanu@kde.org>
pkgname=ruqola-git
pkgver=1.9.54alpha
pkgrel=1
epoch=
pkgdesc="Rocket.Chat client for the KDE desktop"
arch=('x86_64')
url="https://invent.kde.org/network/ruqola/"
license=('GPL2')
groups=()
depends=('qt5-networkauth' 'qt5-websockets' 'qtkeychain' 'hicolor-icon-theme' 'syntax-highlighting' 'kwidgetsaddons' 'kuserfeedback' 'knotifyconfig' 'kdoctools' 'prison')
makedepends=('cmake' 'extra-cmake-modules' 'git')
provides=(ruqola)
conflicts=(ruqola)
_name=ruqola
source=("git+https://invent.kde.org/network/$_name.git")
md5sums=('SKIP')

build() {
	mkdir -p "$srcdir/build"
	cd "$srcdir/build"
	cmake "$srcdir/$_name" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib
	cmake --build .
}

package() {
	cd "$srcdir/build"
	DESTDIR="$pkgdir" cmake --install .
}
