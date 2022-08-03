# Maintainer: mekb https://github.com/mekb-turtle
# Maintainer: Enzo Barrett <enzobarrett@gmail.com>
pkgname=npiano-git
pkgver=V0.9.r9.g49b743d
pkgrel=1
pkgdesc="A piano in ncurses"
arch=('any')
url="https://github.com/enzobarrett/npiano"
license=('GPL')
depends=('ncurses' 'beep')
source=("npiano::git+${url}.git")
sha256sums=(SKIP)

build() {
	cd "npiano"
	make
}

package() {
	cd "npiano"
	install -m755 -D npiano $pkgdir/usr/bin/npiano
}

pkgver() {
	cd "npiano"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
