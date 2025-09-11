# Maintainer: LuckyTurtleDev [aur at lukas1818 dot de]
# Contributor: Shantanu Tushar <shantanu@kde.org>

_pkgtag=v2.5.3 #auto updated by CI
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
sha512sums=('0966be45e8f127105b40b7686b67f06c2fd526cbeb76862e5842d9eba7a2e4472e072400c995fbdf0126876232b50d7ed7eb1b533b8acd58a9dd10625afecfc4')

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
