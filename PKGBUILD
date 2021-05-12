# Maintainer: Dylan Barker <dthomasbarker@gmail.com>
_pkgname=dwl
pkgname=$_pkgname-dylan-git
pkgver=0.2.1.r13.c58d8b1
pkgrel=1
pkgdesc="Dylan's build for hackable dynamic tiling Wayland compositor (dwm for Wayland)"
arch=('x86_64')
url="https://github.com/dylantjb/$_pkgname"
license=('GPL')
depends=('wlroots')
makedepends=('git' 'wayland-protocols')
provides=($_pkgname)
conflicts=($_pkgname)
source=("git+$url")
md5sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "%s" "$(git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd $_pkgname
    make
}

package() {
	cd $_pkgname
	make PREFIX="$pkgdir/usr" install
}
