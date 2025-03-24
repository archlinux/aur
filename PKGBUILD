# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: <leo.sautron@epitech.eu>
pkgname=quick
pkgver=4.9.r4.79b94ce
pkgrel=1
epoch=
pkgdesc=""
arch=(x86_64)
url="https://github.com/ElPepitaux/Quick.git"
license=('GPL')
groups=()
depends=()
makedepends=(git)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

pkgver () {
	cd Quick
	printf "4.9.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd Quick
	make
}

package() {
	cd Quick
	make DESTDIR="$pkgdir/" PREFIX=/usr install
}
