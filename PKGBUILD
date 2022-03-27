# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Moritz Sokoll <moritz@sokoll.com>
pkgname=gweb
pkgver=1.4.6
pkgrel=1
epoch=
pkgdesc="a simple web browser written in C"
arch=('any')
license=("MIT")
groups=()
depends=("gtk3" "webkit2gtk")
makedepends=("make" "gcc" "pkgconf")
checkdepends=()
optdepends=()
provides=('gweb')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://gitlab.sokoll.com/moritz/gweb/-/archive/3638f2e63fd1a9b7a012899743c7ecee0d4a706a/gweb-3638f2e63fd1a9b7a012899743c7ecee0d4a706a.tar.gz")
sha256sums=('3e26e45994ed197b7fb516e68a384ec29b1446c9fa7803d77f26cc4aedd63033')
noextract=()
validpgpkeys=()

prepare() {
	cd gweb-3638f2e63fd1a9b7a012899743c7ecee0d4a706a
	./configure.sh -p "$pkgdir/usr" -r
}

build() {
	cd gweb-3638f2e63fd1a9b7a012899743c7ecee0d4a706a
	make
}

package() {
	cd gweb-3638f2e63fd1a9b7a012899743c7ecee0d4a706a
	make install
}
