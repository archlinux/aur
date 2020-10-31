# Maintainer: jurplel <jurplel[at]interversehq[dotcom]>
pkgname=qview
pkgver=4.0
pkgrel=1
epoch=
pkgdesc="qView is a Qt image viewer designed with minimalism and usability in mind."
arch=('i686' 'x86_64')
url="https://interversehq.com/qview/"
license=('GPL3')
groups=()
depends=('qt5-base>=5.9' 'hicolor-icon-theme')
optdepends=('qt5-imageformats: Extra image format support' 'kimageformats: Support for even more extra formats' 'qt5-svg: SVG support' 'qt5-apng-plugin: APNG support' 'qt5-heif: HEIF support' 'qt-avif-image-plugin-git: AVIF support' 'qtraw: RAW support')
makedepends=()
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
sha256sums=('ab9d2a6379eca0754e06d19666f4af53c7ade34a0272801d4313712ef6cfa18a')
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
