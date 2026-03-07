# Maintainer: link2xt <link2xt@testrun.org>
pkgname=lomiri-ui-toolkit
pkgver=1.3.5903
pkgrel=1
epoch=
pkgdesc="Lomiri UI Toolkit"
arch=('x86_64')
url="https://gitlab.com/ubports/development/core/lomiri-ui-toolkit"
license=('LGPL-3.0-only')
groups=()
depends=('lttng-ust' 'qt5-pim' 'qt5-systems' 'qt5-svg' 'qt5-graphicaleffects' 'qt5-feedback')
makedepends=('qt5-tools')
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
sha256sums=('1aeca827586965b27cbb85129488e7a1c12b436c3f2b339abd7dd121a2aeecc9')
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
	sed -i /_FORTIFY_SOURCE/d features/lomiri_common.prf
}

build() {
	cd "$pkgname-$pkgver"
	qmake-qt5 CONFIG+="no_docs"
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
