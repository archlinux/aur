# Maintainer: Coral Pink <coral.pink@disr.it>
_pkgname=unshell
pkgname=unshell-git
pkgver=0.10.0.r0.g5650b72
pkgrel=1
pkgdesc='A utility for splitting input into shell-like tokens'
url='https://codeberg.org/coralpink/unshell'
source=('git+https://codeberg.org/coralpink/unshell.git')
arch=('any')
license=('custom:MIT+NIGGER')
md5sums=('SKIP')
conflicts=('unshell')
provides=('unshell')
makedepends=(git)

build() {
    cd "$srcdir/$_pkgname"
	make
}

package() {
    cd "$srcdir/$_pkgname"
	make DESTDIR="$pkgdir" PREFIX=/usr PACKAGE_NAME="$pkgname" install
}

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
