# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: KScott <kscott.db@gmail.com>
pkgname=tecnoballz
pkgver=0.93.1
pkgrel=1
epoch=
pkgdesc="Addicting retro break-out game ported from the Amiga"
arch=($CARCH)
url="http://linux.tlk.fr/games/TecnoballZ"
license=('GPL3')
groups=()
depends=("sdl"
         "sdl_mixer"
         "sdl_image"
         "tinyxml"
         "libmikmod")
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
source=(
    "$pkgname-$pkgver.tgz::http://linux.tlk.fr/games/TecnoballZ/download/tecnoballz-0.93.1.tgz"
)
noextract=()
md5sums=("7beeacb06fa841382f0ecbe73f64723a")
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
    ./bootstrap
	./configure --prefix=/usr
	make CXXFLAGS="-O2 -Wno-error -pedantic -Wextra -std=gnu++98"
}

check() {
	cd "$pkgname-$pkgver"
	make check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
