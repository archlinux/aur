# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: mdrakea3 <mdrakea3@tutanota.com>
pkgname=rodder-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=r56.4af1db2
pkgrel=1
pkgdesc="A user-based package manager in Python3"
arch=('x86_64')
url="https://github.com/Ruthenic/rodder"
license=('Unlicense')
groups=()
depends=('python' 'git')
makedepends=('git') 
provides=("$pkgname")
conflicts=("$pkgname")
replaces=()
backup=()
options=()
install=
source=('rodder::git+https://github.com/Ruthenic/rodder')
noextract=()
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/rodder"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/rodder"
}

check() {
	$srcdir/rodder/rodder check >> /dev/null
}

package() {
	cd "$srcdir/rodder"
	mkdir $pkgdir/usr
	mkdir $pkgdir/usr/bin
	mv $srcdir/rodder/rodder $pkgdir/usr/bin
}
