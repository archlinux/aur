# Maintainer: mekb https://github.com/mekb-turtle
pkgname=todo-mekb-git
pkgver=r13.f301191
pkgrel=2
pkgdesc='Terminal to-do list written in C'
arch=('any')
url="https://github.com/mekb-turtle/todo"
source=("todo::git+${url}.git")
makedepends=('git')
sha256sums=(SKIP)
package() {
	install -Dm755 "$srcdir/todo/todo" "$pkgdir/usr/local/bin/todo"
}
build() {
	make -C "$srcdir/todo"
}
pkgver() {
	cd "$srcdir/todo"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
