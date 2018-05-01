# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=libinstpatch
pkgver=1.0.0
pkgsvnver=+svn386
pkgrel=1
epoch=
pkgdesc="Instrument patch library"
arch=('x86_64' 'i386')
url="http://swamiproject.org"
license=('LGPLv2')
groups=()
depends=('glib2' 'libsndfile')
makedepends=('cmake' 'python3')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://download.savannah.gnu.org/releases/gsequencer/1.4.x/$pkgname-$pkgver$pkgsvnver.tar.bz2")
noextract=()
md5sums=('3e90da59e1d088ff9dbb270a1349cd99')
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	mkdir build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

check() {
	cd "$pkgname-$pkgver"
	cd build
#	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	cd build
	make DESTDIR="$pkgdir/" install
}
