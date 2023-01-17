# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=ioperm-git
pkgver=r1.6d1a6c8
pkgrel=1
pkgdesc='Start a program with access to I/O ports'
arch=('x86_64')
url='https://gitlab.com/alexhenrie/ioperm'
license=('GPL')
install=ioperm.install
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd ioperm
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd ioperm
	cc ioperm.c -o ioperm
}

package() {
	cd ioperm
	install -Dm755 ioperm "$pkgdir/usr/bin/ioperm"
}
