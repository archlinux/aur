# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Moritz Sokoll <moritz@sokoll.com>
pkgname=vct
pkgver=1.3.7
pkgrel=1
epoch=
pkgdesc="a vocabulary trainer written in rust"
arch=('any')
license=("MIT")
groups=()
depends=()
makedepends=("rustup")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://gitlab.sokoll.com/moritz/vct/-/archive/bc40988bf263e8163e397ba39f7a543724b17800/vct-bc40988bf263e8163e397ba39f7a543724b17800.tar.gz")
noextract=()
sha256sums=("8c6405acb4af151b8acc4d9b64ec0eaaee3b7f4f29d25a6c66133c1f2a0a9d60")
validpgpkeys=()

build() {
	cd 'vct-bc40988bf263e8163e397ba39f7a543724b17800'
	rustup install $(cat rust-toolchain)
	./configure.sh -p "$pkgdir/usr"
	make
}

#check() {
#	cd gimgview-master
#	make -k check
#}

package() {
	cd 'vct-bc40988bf263e8163e397ba39f7a543724b17800'
	mkdir -p "$pkgdir"/usr/bin
	make install
}
