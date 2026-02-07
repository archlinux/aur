# Maintainer: LuckyTurtleDev [aur at lukas1818 dot de]
# Contributor: Shantanu Tushar <shantanu@kde.org>

_pkgtag=v2.6.1 #auto updated by CI
pkgname=ruqola
pkgver=${_pkgtag/v}
pkgrel=1 #auto reset by CI
epoch=
pkgdesc="Rocket.Chat client for the KDE desktop"
arch=('x86_64')
url="https://invent.kde.org/network/ruqola/"
license=('GPL2')
groups=()
depends=('hicolor-icon-theme' 'kcodecs' 'kidletime' 'knotifyconfig' 'kstatusnotifieritem' 'ktextaddons' 'ktextwidgets' 'networkmanager-qt' 'prison' 'qt6-networkauth' 'qt6-websockets' 'qtkeychain-qt6' 'purpose')
makedepends=('cmake' 'extra-cmake-modules')
source=("https://invent.kde.org/network/ruqola/-/archive/$_pkgtag/ruqola-$_pkgtag.tar.gz")
sha512sums=('27083faddc0015e4eb2700238a9c29bd06ecec4a04f30c86f849701d9266ba2dd8cee0b3e0565f0a00015c368590b1e2c08efc104b72564df93106f207c007cd')

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
