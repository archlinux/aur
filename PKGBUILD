# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Carlo Cabanilla <carlo.cabanilla@gmail.com>

pkgname=(lua-luafilesystem lua52-luafilesystem lua51-luafilesystem)
pkgver=1.7.0
_tag=${pkgver//./_}
pkgrel=2
pkgdesc="A lua library to access the underlying directory structure and file attributes"
arch=(i686 x86_64)
url="http://keplerproject.github.io/luafilesystem/"
license=('MIT')
depends=(lua)
makedepends=(make gcc)
install=
changelog=
source=("luafilesystem-${_tag}.tar.gz::https://github.com/keplerproject/luafilesystem/archive/v${_tag}.tar.gz")
sha256sums=('854ef99b6a4eb48af00c304e26fc4429094a8612003a7a81ba22014f32e85db3')

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
