# Maintainer: mdrakea3 <mdrakea3@tutanota.com>
pkgname=rodder-git
pkgver=r67.c52c026
pkgrel=1
pkgdesc="A user-based package manager in Python3"
arch=('x86_64')
url="https://github.com/Ruthenic/rodder"
license=('Unlicense')
groups=()
depends=('python' 'git' 'python-requests')
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
