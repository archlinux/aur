# Maintainer: FuzzyNovaGoblin Name <fuzzy.nova.goblin@outlook.com>

pkgname=fuz-calc-git
pkgdesc="GTK gui pop up calculator using libqalculate"
pkgver=0.0.1
pkgrel=1
epoch=
pkgdesc=""
arch=(x86_64)
url="https://github.com/FuzyTechLLC/FuzCalc"
license=('GPL')
groups=()
depends=('gtkmm3' 'xclip' 'libqalculate')
makedepends=('git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/FuzyTechLLC/FuzCalc")
noextract=()
md5sums=('SKIP')
validpgpkeys=()
rtname="FuzCalc"

prepare() {
	cd "$rtname"
}

build() {
	cd "$rtname"
	mkdir bin | echo exists
	mkdir lib | echo exists
	make
}

check() {
	cd "$rtname"
}

package() {
	cd "$rtname"
	mkdir "$pkgdir/usr"
	mkdir "$pkgdir/usr/lib"
	mkdir "$pkgdir/usr/bin"

	make LIB_INSTALL_DIR="$pkgdir/usr/lib" BIN_INSTALL_DIR="$pkgdir/usr/bin" install
}
