# Maintainer: osch <oliver@luced.de>
# Contributor: Pierre Neidhardt <ambrevar@gmail.com>
# Contributor: Michal Minar <mr.mini@centrum.cz>
# Contributor: Zsolt Udvari <udvzsolt@gmail.com>

_pkgname=oocairo
pkgname=lua-$_pkgname
pkgver=1.5
pkgrel=1
pkgdesc="Module providing access to Cairo from within Lua"
arch=("i686" "x86_64")
url="https://github.com/awesomeWM/$_pkgname"
license=("MIT")
depends=("cairo>=1.8.0" "lua>=5.1")
makedepends=("git" "libtool" "pkgconfig")
provides=("lua-oocairo")
conflicts=("lua-oocairo")
source=("https://github.com/awesomeWM/$_pkgname/archive/v$pkgver.tar.gz")

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	autoreconf --install
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/lua-$_pkgname/COPYRIGHT"
}
md5sums=('887981465a1eaea01a5af9c71e6fc90c')
