# Maintainer: Ian D. Scott <ian@perebruin.com>

pkgname=luadoc
pkgver=3.0.1
pkgrel=1
pkgdesc="Lua documentation generator"
arch=('any')
url="https://keplerproject.github.io/luadoc/"
license=('MIT')
depends=('lua51' 'lua51-filesystem')
source=("http://files.luaforge.net/releases/luadoc/luadoc/LuaDoc-3.0.1/luadoc-${pkgver}.tar.gz")
md5sums=('ec3a0c0b9413e401a2d466cc0930d505')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i "s|/usr/local|${pkgdir}/usr|" config
  sed -i "s|#!/usr/bin/env lua|#!/usr/bin/env lua5.1|" src/luadoc.lua.in

}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make install
}
