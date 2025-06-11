# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: link2xt <link2xt@testrun.org>
pkgname=lomiri-ui-toolkit
pkgver=1.3.5110
pkgrel=1
epoch=
pkgdesc="Lomiri UI Toolkit"
arch=('x86_64')
url="https://gitlab.com/ubports/development/core/lomiri-ui-toolkit"
license=('LGPL-3.0-only')
groups=()
depends=('lttng-ust' 'qt5-pim')
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
source=("https://gitlab.com/ubports/development/core/lomiri-ui-toolkit/-/archive/$pkgver/lomiri-ui-toolkit-$pkgver.tar.gz")
noextract=()
sha256sums=('62f8f9878ea5806f38875282a4cad4ee639885061e346051de5528dedfa5968e')
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	qmake
	make
}

check() {
	cd "$pkgname-$pkgver"
	#make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make INSTALL_ROOT="$pkgdir/" install
}
