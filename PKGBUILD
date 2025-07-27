# Maintainer: jurplel <jurplel[at]interversehq[dotcom]>
pkgname=qview
pkgver=7.1
pkgrel=2
epoch=
pkgdesc="qView is a Qt image viewer designed with minimalism and usability in mind."
arch=('i686' 'x86_64')
url="https://interversehq.com/qview/"
license=('GPL3')
groups=()
depends=('qt6-base' 'hicolor-icon-theme')
optdepends=('qt6-imageformats: Extra image format support' 'kimageformats: Support for even more extra formats' 'qt6-svg: SVG support')
makedepends=('qt6-tools')
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/jurplel/qView/archive/refs/tags/$pkgver.tar.gz")
noextract=()
sha256sums=('89189b508b60526af09a15bc7b467eecb7f3d074f5dd21d251afe23406b24e8a')
validpgpkeys=()

build() {
	cd qView-$pkgver
	qmake6 PREFIX=/usr
	make
}

package() {
	cd qView-$pkgver
	make INSTALL_ROOT="$pkgdir/" install
}
