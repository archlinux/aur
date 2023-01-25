# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Vincent Bidard de la Noë <vincentbidarddelanoe@gmail.com>
pkgname="auto-git-puller-git"
pkgver="0.1"
pkgrel=1
pkgdesc="A program to automatically pull every git repository in a folder"
arch=('any')
url="https://github.com/Vinz2008/auto-git-puller"
license=('GPL')
makedepends=("git")
depends=()
sha256sums=('SKIP')
install=
changelog=
source=("auto-git-puller::git+https://github.com/vinz2008/auto-git-puller.git")
noextract=()

build() {
	echo ${srcdir}
	cd ${srcdir}/auto-git-puller
	make
}

package() {
	cd ${srcdir}/auto-git-puller
	mkdir -p $pkgdir/usr/bin
	make DESTDIR="$pkgdir/usr" install
}
