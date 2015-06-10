# Maintainer: Carlo Cabanilla <carlo.cabanilla@gmail.com>
pkgname=(lua-luafilesystem lua52-luafilesystem lua51-luafilesystem)
pkgver=1.6.3
_tag=v_${pkgver//./_}
pkgrel=1
pkgdesc="A lua library to access the underlying directory structure and file attributes"
arch=(i686 x86_64)
url="http://keplerproject.github.io/luafilesystem/"
license=('MIT')
depends=(lua)
makedepends=(make gcc)
install=
changelog=
source=("luafilesystem-${_tag}.tar.gz::https://github.com/keplerproject/luafilesystem/archive/${_tag}.tar.gz")
md5sums=('d0552c7e5a082f5bb2865af63fb9dc95')

build() {
	cd "luafilesystem-${_tag}"
	make
}

package() {
	_luaver=$1
	cd "luafilesystem-${_tag}"
	export PREFIX=${pkgdir}/usr
	export LUA_LIBDIR=${PREFIX}/lib/lua/${_luaver}
	make -e install
}

package_lua-luafilesystem() {
	package 5.3
}

package_lua52-luafilesystem() {
	package 5.2
}

package_lua51-luafilesystem() {
	package 5.1
}
