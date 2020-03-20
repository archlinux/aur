# Contributor: bitwave <aur [aeatt] oomlu [do0t] de>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Sébastien Luttringer <seblu@archlinux.org>
# Contributor: Anders Bergh <anders1@gmail.com>
# Contributor: strata <strata@dropswitch.net>
pkgname=lua51-sql-sqlite
pkgver=2.3.0
pkgrel=4
arch=('i686' 'x86_64')
url='http://www.keplerproject.org/luasql/'
license=('MIT')
pkgdesc='SQLite module for Lua 5.1'
depends=('lua51' 'sqlite')
makedepends=('luarocks' 'git')

build() {
 luarocks --lua-version=5.1 --tree="${srcdir}" build luasql-sqlite3
}

package() {
  mkdir -p "$pkgdir/usr/lib/lua/5.1/luasql"
  install -m 755 "${srcdir}/lib/lua/5.1/luasql/sqlite3.so" \
    "${pkgdir}/usr/lib/lua/5.1/luasql/sqlite3.so"
}

# vim:set ts=2 sw=2 et:
