# Maintainer: Jerome Leclanche <jerome@leclan.ch>
# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

_pkgname=lxqt-qtplugin
pkgname=lxqt-qt5plugin
pkgver=1.4.1
pkgrel=1
pkgdesc="LXQt platform integration for Qt"
arch=("x86_64")
groups=("lxqt")
url="https://github.com/lxqt/$_pkgname"
# https://github.com/lxqt/lxqt-qtplugin/blob/1.4.1/AUTHORS#L8
license=("LGPL-2.1-or-later")
depends=("libdbusmenu-qt5" "libqt5xdg" "qt5-x11extras" "libfm-qt5" "libQt5XdgIconLoader.so")
makedepends=("git" "lxqt-build-tools-qt5")
source=(
	"git+https://github.com/lxqt/$_pkgname?signed#tag=$pkgver"
)
sha256sums=('022d1eacc98ac0b089dacef65f265c27bd7a6caed404112b2d3a34a1e2c75e35')
validpgpkeys=(
	"19DFDF3A579BD509DBB572D8BE793007AD22DF7E"  # Pedram Pourang <tsujan2000@gmail.com>
)

build() {
	cmake -B build -S "$srcdir/$_pkgname" \
	  -DCMAKE_INSTALL_PREFIX=/usr \
	  -DCMAKE_BUILD_TYPE=None
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
