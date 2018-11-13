# Maintainer: noirscape <neko at catgirlsin dot space>
pkgname=fatattr-git
_pkgname=fatattr
pkgver=1
pkgrel=1
pkgdesc="Small linux application to see or modify MSDOS attributes in a FAT file system"
arch=('x86_64' 'i686')
url="https://github.com/Terseus/fatattr"
license=('GPL')
depends=()
makedepends=('git' 'scons' 'clang')
provides=('fatattr')
conflicts=('fatattr')
options=()
source=(git+https://github.com/Terseus/fatattr.git)
md5sums=('SKIP')
build() {
	cd "$srcdir"/"$_pkgname"
        scons
}
package() {
	cd "$srcdir"/"$_pkgname"
	mkdir -p "$pkgdir"/usr/bin
	install -Dm755 "bin/$_pkgname" "$pkgdir"/usr/bin
}
