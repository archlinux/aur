# Maintainer: Gabriele Fulgaro <gabriele.fulgaro@gmail.com>

_pkgname="strcase"

pkgname="$_pkgname-git"
pkgver=r6.7d27f69
pkgrel=1
pkgdesc="Multiway branch (switch) for short strings in C (in one header file)"
arch=('any')
url="https://github.com/rd235/$_pkgname"
license=('GPL2')
provides=("$_pkgname")
conflicts=("$_pkgname")
replaces=("$_pkgname")
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	cmake -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
	cd "$_pkgname"
	make DESTDIR="$pkgdir/" install
}
