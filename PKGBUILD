pkgname=sl-new-git
_gitname=sl
pkgver=5.02.r2.g7b65599
pkgrel=1
pkgdesc='Steam Locomotive runs across your terminal when you type "sl" as you meant to type "ls"'
arch=('i686' 'x86_64')
url="http://www.tkl.iis.u-tokyo.ac.jp/~toyoda/index_e.html"
license=('free')
depends=('ncurses')
makedepends=('git')
provides=('sl')
conflicts=('sl')
source=("git://github.com/arthurzam/sl.git")
md5sums=('SKIP')

pkgver() {
	cd "$_gitname"
	git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "$_gitname"
	make
}

package() {
	cd "$_gitname"
    make DESTDIR="$pkgdir" install
}
