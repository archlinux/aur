# Maintainer: Nikita Ivanov <nikita dot vyach dot ivanov at gmail dot com>
pkgname=ictree
pkgver='0.2.1'
pkgrel=1
pkgdesc="Like tree but interactive"
arch=('i686' 'x86_64')
url="https://github.com/NikitaIvanovV/ictree"
license=('GPL3')
depends=('glibc')
optdepends=('xsel: for copying selected item into X clipboard')
makedepends=('git')
source=("git+https://github.com/NikitaIvanovV/ictree.git#tag=v$pkgver?signed")
validpgpkeys=('701DE74D84F87EE1BC91CD216E656AC5B97B5133')
sha512sums=('SKIP')

prepare() {
	cd "$pkgname"
	git submodule init
	git submodule update
}
build() {
	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
}
