# Maintainer: LuckyTurtleDev [aur at lukas1818 dot de]
# Contributor: Shantanu Tushar <shantanu@kde.org>

_pkgtag=v2.1.1
pkgname=ruqola
pkgver=${_pkgtag/v}
pkgrel=1
epoch=
pkgdesc="Rocket.Chat client for the KDE desktop"
arch=('x86_64')
url="https://invent.kde.org/network/ruqola/"
license=('GPL2')
groups=()
depends=('hicolor-icon-theme' 'kidletime' 'knotifyconfig5' 'ktextaddons5' 'networkmanager-qt5' 'prison5' 'qt5-networkauth' 'qt5-websockets' 'qtkeychain-qt5' 'purpose5')
makedepends=('cmake' 'extra-cmake-modules')
source=("https://invent.kde.org/network/ruqola/-/archive/$_pkgtag/ruqola-$_pkgtag.tar.gz")
sha512sums=('ec5f70b288600a15f72227a33ba5f9dbd981ba7376c56d1f39eef50afb9c41c8e648a401ec9c470b3ad8927abc8c341fd58b920f2873ed8e3ed49a869127d812')

build() {
	mkdir -p "$srcdir/build"
	cd "$srcdir/build"
	cmake "$srcdir/$pkgname-$_pkgtag" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib
	cmake --build .
}

package() {
	cd "$srcdir/build"
	DESTDIR="$pkgdir" cmake --install .
}
