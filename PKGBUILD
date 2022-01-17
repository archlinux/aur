# Maintainer: jurplel <jurplel[at]interversehq[dotcom]>
pkgname=qview
pkgver=5.0
pkgrel=1
epoch=
pkgdesc="qView is a Qt image viewer designed with minimalism and usability in mind."
arch=('i686' 'x86_64')
url="https://interversehq.com/qview/"
license=('GPL3')
groups=()
depends=('qt5-base>=5.9' 'hicolor-icon-theme')
optdepends=('qt5-imageformats: Extra image format support' 'kimageformats: Support for even more extra formats' 'qt5-svg: SVG support' 'qt5-apng-plugin: APNG support' 'qtraw: RAW support')
makedepends=('qt5-tools')
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/jurplel/qView/releases/download/$pkgver/qView-$pkgver.tar.gz")
noextract=()
sha256sums=('2d09b0bd0c439aacbd02613b0dd5c2e9f8f5458739717f86288addcdb6225245')
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
