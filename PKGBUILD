# Maintainer: Xabre <githzerai06 AT gmail DOT com>

pkgname=lua51-utf8
pkgver=0.1.1
_rockname=luautf8
_rockrel=1
pkgrel=1
pkgdesc="Add UTF-8 support to Lua, compatible with Lua string module. (Lua 5.1 version)"
arch=('i686' 'x86_64')
url="http://github.com/starwing/luautf8"
license=('MIT')
depends=('lua51')
makedepends=('luarocks5.1')
conflicts=()
source=("https://luarocks.org/${_rockname}-${pkgver}-${_rockrel}.src.rock")
sha256sums=('51aa211a9d39d62c65bfcca4eccb8482a11bfe918992eed58104b646338d62a0')

build() {
  luarocks-5.1 --tree="${srcdir}" install --deps-mode=none "${_rockname}-${pkgver}-${_rockrel}.src.rock"
}
package() {
  mkdir -p "${pkgdir}/usr/lib/lua/5.1"
  install -m 755 "${srcdir}/lib/lua/5.1/lua-utf8.so" "${pkgdir}/usr/lib/lua/5.1/lua-utf8.so"
}

