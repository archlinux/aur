# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: KiYugadgeter <getalotofmail@gmail.com
_pkgname=rune
pkgname=rune-git
pkgver=0.0.1
pkgrel=3
epoch=
pkgdesc='faster, safer, and more productive systems programming language (Unfinished)'
arch=('x86_64')
url='https://github.com/google/rune'
license=('Apache')
sha256sums=('SKIP' 'SKIP')
groups=()
depends=()
makedepends=('git' 'gmp' 'clang' 'datadraw-git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/google/rune.git" "git+https://github.com/pornin/CTTK.git")
noextract=()
validpgpkeys=()

prepare() {
    cp "$srcdir/CTTK/inc/cttk.h" "$srcdir/CTTK"
}

build() {
    cd "$srcdir/$_pkgname"
    make
}

check() {
	cd "$srcdir/$_pkgname"
    make check
}

package() {
	cd "$srcdir/$_pkgname"
    make PREFIX="$pkgdir/usr" install
}

