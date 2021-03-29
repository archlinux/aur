# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Moritz Sokoll <moritz@sokoll.com>
pkgname=gimgview
pkgver=1.0.1
pkgrel=1
epoch=
pkgdesc="a simple gtk3 based image viewer"
arch=('any')
license=("GPL")
groups=()
depends=("gtk3")
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
source=("https://gitlab.sokoll.com/moritz/gimgview/-/archive/master/gimgview-master.tar.gz")
noextract=()
sha256sums=("695cfd1f9cce0250584a23bb1a6a6bcc043b508ea0d30d5b78a9e98ccb07db2b")
validpgpkeys=()

build() {
	cd gimgview-master
	make
}

check() {
	cd gimgview-master
	make -k check
}

package() {
	cd gimgview-master
	mkdir "$pkgdir"/usr
	mkdir "$pkgdir"/usr/bin
	make DESTDIR="$pkgdir/usr/bin" install
}
