# Maintainer: jurplel <jurplel[at]interversehq[dotcom]>
pkgname=qview
pkgver=6.1
pkgrel=1
epoch=
pkgdesc="qView is a Qt image viewer designed with minimalism and usability in mind."
arch=('i686' 'x86_64')
url="https://interversehq.com/qview/"
license=('GPL3')
groups=()
depends=('qt5-base>=5.9' 'hicolor-icon-theme')
optdepends=('qt5-imageformats: Extra image format support' 'kimageformats: Support for even more extra formats' 'qt5-svg: SVG support' 'qt5-apng-plugin: APNG support')
makedepends=('qt5-tools')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/jurplel/qView/releases/download/$pkgver/qView-$pkgver.tar.gz")
noextract=()
sha256sums=('0d7ab3aaea2e9f89034bdeeb6350d31a5d9fb5ac9158b98348e8ccbf1dc6570a')
validpgpkeys=()

build() {
	cd qView
	qmake PREFIX=/usr
	make
}

package() {
	cd qView
	make INSTALL_ROOT="$pkgdir/" install
}
