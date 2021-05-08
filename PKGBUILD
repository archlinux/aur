# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Moritz Sokoll <moritz@sokoll.com>
pkgname=gimgview
pkgver=1.0.1
pkgrel=1
epoch=
pkgdesc="a simple gtk3 based image viewer written in C++"
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
sha256sums=("ba61848b1979c337e8ab9c92c96c05937393368e3afc2a01fc1ea997cfc1f6fa")
validpgpkeys=()

build() {
	cd gimgview-master
	make build
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
	make MANDIR="$pkgdir/usr/man" manpage
}
