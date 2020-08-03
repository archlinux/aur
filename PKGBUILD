# Maintainer: timescam <rex.ky.ng at gmail dot com>

_pkgname=paleta
pkgname=$_pkgname-git
pkgver=r138.b200489
pkgrel=3
pkgdesc="Change terminal colors on-the-fly independent of terminal emulator. "
arch=(any)
url="https://github.com/dylanaraps/$_pkgname"
license=('MIT')
makedepends=('git')

provides=("$_pkgname")

source=("$_pkgname::git+https://github.com/dylanaraps/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
        cd "$srcdir/$_pkgname"
        echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	make
}

package () {
        cd "$_pkgname"
        make DESTDIR="$pkgdir/" install
}
