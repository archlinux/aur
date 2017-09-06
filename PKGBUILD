# Maintainer: Charles Milette <charles.milette@gmail.com>

_gitname=todo
pkgname=${_gitname}-dot-sh-git
pkgver=r30.f85e5af
pkgrel=1
pkgdesc="A bash script that manages todo lists in ~/.todo"
arch=('any')
url="https://github.com/simoniz0r/${_gitname}"
license=('GPL2')
source=("git://github.com/simoniz0r/${_gitname}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_gitname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/${_gitname}"
	install -Dm755 todo.sh "${pkgdir}/usr/bin/todo"
}