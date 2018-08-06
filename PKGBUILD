# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=rabs
pkgver=1.2.0
pkgrel=2
epoch=
pkgdesc="Generic imperative build system"
arch=('x86_64' 'i686')
url=""
license=('MIT')
groups=()
depends=('gc' 'sqlite')
makedepends=()
checkdepends=()
optdepends=()
provides=('rabs')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/wrapl/$pkgname#tag=v$pkgver")
noextract=()
md5sums=(SKIP)
validpgpkeys=()

prepare() {
	cd "$pkgname"
	git submodule update --init --recursive
}

build() {
	cd "$pkgname"
	make
}

check() {
	cd "$pkgname"
}

package() {
	cd "$pkgname"
	make PREFIX="$pkgdir/usr" install
}
