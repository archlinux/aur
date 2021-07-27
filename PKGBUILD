# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Moritz Sokoll <moritz@sokoll.com>
pkgname=gimgview
pkgver=2.0.1
pkgrel=1
epoch=
pkgdesc="a simple gtk3 based image viewer written in C"
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
sha256sums=("d93c12cab463461e6e072e3585e10bb8ca566652955f92e54906926ef7fb4661")
validpgpkeys=()

build() {
	cd gimgview-master
	make build
}

#check() {
#	cd gimgview-master
#	make -k check
#}

package() {
	cd gimgview-master
	mkdir "$pkgdir"/usr
	mkdir "$pkgdir"/usr/bin
	make DESTDIR="$pkgdir/usr/bin" MANDIR="$pkgdir/usr/man" install
}
