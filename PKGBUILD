# Maintainer: Nici <NicolasVontobel at protonmail dot com>
pkgname='lavat-git'
_pkgname='lavat'
pkgver=r13.5d2629c
pkgrel=1
epoch=1
pkgdesc="Little program that simulates a lava lamp in the terminal."
arch=('any')
url="https://github.com/AngelJumbo/lavat.git"
license=('MIT')
depends=()
makedepends=() 
source=('git+https://github.com/AngelJumbo/lavat.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd ${_pkgname}
	make
}

package() {
	cd ${_pkgname}
	install -Dm755 ./lavat "$pkgdir/usr/bin/$_pkgname"
}
