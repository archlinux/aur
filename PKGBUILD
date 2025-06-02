# Maintainer: LuckyTurtleDev [aur at lukas1818 dot de]
# Contributor: Shantanu Tushar <shantanu@kde.org>

_pkgtag=v2.5.1 #auto updated by CI
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
sha512sums=('82f28088eb88c92e5f6a6e3227d3fa9ef23da12b83fe409e99b64156b0a751850d74346c565f0d0feccc671e373ccdf8d287f5f7d8d41cf2716ff7d3983a0f6f')

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
