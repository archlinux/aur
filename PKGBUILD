# Maintainer: Andy Kluger <https://t.me/andykluger>
# Contributor: jurplel <jeep70cp[at]gmail[dotcom]>
_pkgname=qview
pkgname=qview-git
pkgver=r434.4d15b97
pkgrel=1
epoch=
pkgdesc="qView is a Qt image viewer designed with minimalism and usability in mind."
arch=('i686' 'x86_64')
url="https://interversehq.com/qview/"
license=('GPL3')
groups=()
depends=('qt5-base>=5.9' 'hicolor-icon-theme')
optdepends=('xdg-utils: Used to open containing folder of file' 'qt5-imageformats: Extra image format support' 'qt5-svg: SVG support')
makedepends=('git' 'qt5-base')
checkdepends=()
provides=('qview')
conflicts=('qview')
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/jurplel/qView")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

pkgver() {
    cd qView
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd qView
	qmake
	make
}

package() {
	cd qView
	make INSTALL_ROOT="$pkgdir/" install
}
