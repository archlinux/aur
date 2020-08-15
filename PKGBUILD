
# Maintainer: Max Briggs <max@maxbriggs.org>
pkgname=todo-git
_gitname="${pkgname%-git}"
pkgver=r38.5ee1311
pkgrel=1
pkgdesc='A simple utility for managing a to-do list'
url='https://github.com/maxrbriggs/todo'
license=('GPL3')
arch=('any')
makedepends=('git')
source=('git+https://github.com/maxrbriggs/todo.git')
md5sums=('SKIP')

pkgver() {
	cd "$_gitname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_gitname"
	make
}

package() {
	cd "$_gitname"
	make DESTDIR="$pkgdir" PREFIX="/usr" install
}
