# Maintainer: Bastian Engel <bastian.engel00 at gmail.com>

pkgname=vex-git
pkgver=v1.0.0
pkgrel=1
pkgdesc="a simple ncurses-based hex editor"
arch=('x86_64' 'i686')
url="https://github.com/Baseng0815/vex.git"
license=('GPL')
groups=()
depends=('ncurses>=6.3-3')
makedepends=('git' 'meson')
provides=("vex")
conflicts=("vex")
source=("git+https://github.com/Baseng0815/vex.git")
md5sums=('SKIP')

build() {
	meson --prefix=/usr --buildtype=release vex build
        meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
}
