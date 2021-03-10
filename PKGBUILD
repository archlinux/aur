# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Moritz Sokoll <moritz@sokoll.com>
pkgname=gimgview
pkgver=1.0.0
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
sha256sums=("7aba7f13f81ccf5f8c24a2ae1351890e233a2995ac19670d3864d3a87cded101")
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
