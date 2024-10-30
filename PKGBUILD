# Maintainer: LuckyTurtleDev [aur at lukas1818 dot de]
# Contributor: Shantanu Tushar <shantanu@kde.org>

_pkgtag=v2.3.1 #auto updated by CI
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
sha512sums=('86c0ac1e1de268716330a1b26db59ac4c66c0a3c7d0725ebf4d5a321b4aa009bba27042595685db2cc2785e5626ef64e660a83003c43987be27f5e4ff7843da6')

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
