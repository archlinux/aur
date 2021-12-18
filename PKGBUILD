# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: GhibranAljabbar <ghibranaljaur@gmail.com>
pkgname=rgb-tui-git
pkgver=1.1
pkgrel=1
epoch=
pkgdesc="Create and get colors code from the terminal using a nice interface."
arch=(x86_64)
url="https://github.com/ArthurSonzogni/rgb-tui"
license=('MIT')
groups=()
depends=()
makedepends=(cmake make git)
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
md5sums=('SKIP')
validpgpkeys=()

prepare() {
	cd rgb-tui
	cmake -DCMAKE_BUILD_TYPE=Release .
}

build() {
	cd rgb-tui
	make
}

package() {
	cd rgb-tui
	make DESTDIR="$pkgdir/" install
}
