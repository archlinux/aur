# Maintainer: LuckyTurtleDev [aur at lukas1818 dot de]
# Contributor: Shantanu Tushar <shantanu@kde.org>

_pkgtag=v2.7.0 #auto updated by CI
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
sha512sums=('fc33ada7e21522b8b051fecf0d412bb7d7c56d491230ecd7f44ac972825971a3b2a237f7ec9afc78bc67fea68d94fe7f0f5e29e5ea85c4c2eef1e307dbcfe607')

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
