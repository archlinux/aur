# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Gno <noreply@gno.com>
pkgname=caelestia-gif
pkgver=1.0.1
pkgrel=1
epoch=
pkgdesc="A script to manage and change GIFs in Caelestia shell"
arch=('x86_64')
url="https://gitlab.com/gnoooo/caelestia-gif.git"
license=('GPL-3.0-or-later')
groups=()
depends=('imagemagick' 'cjson' 'xdg-utils' 'ncurses' 'bash')
makedepends=('git' 'base-devel')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://gitlab.com/gnoooo/caelestia-gif/-/archive/master/caelestia-gif-master.tar.gz?ref_type=heads")
noextract=()
sha256sums=('57876817f0719e272ba87e34e9e16648b5bc272e35d6342331540288caf93cd0')
validpgpkeys=()

prepare() {
    cd "$srcdir/$pkgname-main"
}

build() {
    cd "$srcdir/$pkgname-main"
    make
}

check() {
	cd "$srcdir/$pkgname-main"
	make -k check || true
}

package() {
	cd "$srcdir/$pkgname-main"
        #fakeroot ./install_bin
	make DESTDIR="$pkgdir" install
}
