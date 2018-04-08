# Maintainer: Fionn Langhans <fionn.langhans@gmail.com>
pkgname=jfederc-git
pkgver=1.0
pkgrel=1
epoch=

pkgdesc="A compiler for the Feder programming language"
arch=('any')
url="https://github.com/codefionn/feder"
license=('ZLIB')
groups=()
depends=('gcc' 'java-environment>=8')
makedepends=('git')
optdepends=('clang: Another C compiler')
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=()
noextract=()
md5sums=()
validpgpkeys=()

prepare() {
	cd $srcdir
	rm -rf feder
	git clone $url
	cd feder
}

build() {
	cd $srcdir
	cd feder
	./build.sh
}

check() {
	cd $srcdir
	cd feder
	cd federlang
	./tests/test.sh
}

package() {
	cd $srcdir
	cd feder
	./install.sh "$pkgdir"
	mkdir --parents "$pkgdir/usr/share/licenses/jfederc-git"
	cp LICENSE "$pkgdir/usr/share/licenses/jfederc-git/"
}
