# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Matt Coffin <mcoffin13@gmail.com>
pkgname=wwwidgets
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="professional set of useful widgets for qt4 and qt5"
arch=('i686' 'x86_64')
url="http://www.wysota.eu.org/wwwidgets/"
license=('GPL')
groups=()
depends=('qt5-base' 'qt5-tools')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://www.wysota.eu.org/wwwidgets/wwWidgets-$pkgver-qt5.tar.gz")
noextract=()
sha256sums=('81d797e7493a23ee50d695180026cb2a14b0519c834982fee00d3fa63733cd7f')
validpgpkeys=()

prepare() {
    cd "wwWidgets"
}

build() {
	cd "wwWidgets"
	qmake
	make sub-widgets
}

check() {
    cd "wwWidgets"
}

package() {
	cd "wwWidgets"
    mkdir -p "$pkgdir/usr/lib"
	install -m 0644 -t "$pkgdir/usr/lib" "widgets/libwwwidgets4.so.$pkgver"
    ln -s "/usr/lib/libwwwidgets4.so.$pkgver" "$pkgdir/usr/lib/libwwwidgets4.so.1"
    ln -s "/usr/lib/libwwwidgets4.so.$pkgver" "$pkgdir/usr/lib/libwwwidgets4.so"
}
