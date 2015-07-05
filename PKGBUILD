# Contributer: bitwave <aur [at] oomlu [d0t] de>
# Contributor: strata <strata@dropswitch.net>
pkgname=luazip5.1
pkgver=1.2.4
pkgrel=1
pkgdesc="reading files inside zip files"
arch=('i686' 'x86_64')
url="http://www.keplerproject.org/luazip/"
license=('MIT')
depends=('lua51' 'zziplib')
makedepends=('git' 'luarocks5.1')

build() {
  luarocks-5.1 --tree="${srcdir}" build luazip
}

package() {
	mkdir -p "${pkgdir}/usr/lib/lua/5.1"
  install -m 755 "${srcdir}/lib/lua/5.1/zip.so" \
    "${pkgdir}/usr/lib/lua/5.1/zip.so"
}
# vim:set ts=2 sw=2 et:
