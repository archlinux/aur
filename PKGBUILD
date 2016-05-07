# Maintainer: Mewp <aur.archlinux.org@mewp.pl>
pkgname=emptyepsilon-git
pkgver=20160507
pkgrel=1
epoch=
pkgdesc="Open source spaceship bridge simulator"
arch=('x86' 'x86_64')
url="https://github.com/daid/EmptyEpsilon"
license=('GPL2')
groups=()
depends=('sfml')
makedepends=('cmake' 'git' 'mesa')
source=("git+https://github.com/daid/EmptyEpsilon.git"
        "git+https://github.com/daid/SeriousProton.git")
sha256sums=('SKIP' 'SKIP')

build() {
    cd $srcdir/EmptyEpsilon/
	cmake -DSERIOUS_PROTON_DIR=../SeriousProton/ \
          -DCMAKE_CXX_FLAGS='-DINSTALL_PREFIX=\"/usr\"' \
          -DCMAKE_INSTALL_PREFIX=/usr \
          .
	make
}

package() {
	cd $srcdir/EmptyEpsilon
	make DESTDIR="$pkgdir/" install
}

