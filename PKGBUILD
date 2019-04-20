# Maintainer: trougnouf (Benoit Brummer) <trougnouf@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Luca P <meti at lplab.net>

_name=luajson
pkgname=lua-${_name}
pkgver=1.3.4
pkgrel=2
pkgdesc="JSON parser/encoder for Lua"
url="http://luaforge.net/projects/luajson/"
arch=(any)
license=(MIT)
depends=(lua-lpeg)
source=(https://github.com/harningt/$pkgbase/archive/$pkgver.tar.gz)
sha1sums=('2ea25e4147ad661ff3b6d0427439bf99c06eb46d')

package() {
  LUAVERSION=$(lua -v | grep -P -o '([0-9]\.[0-9])')
  cd ${srcdir}/${_name}-${pkgver}
  make PREFIX=/usr DESTDIR="$pkgdir" \
    INSTALL_LMOD='$(INSTALL_TOP)/share/lua/${LUAVERSION}' \
    INSTALL_CMOD='$(INSTALL_TOP)/lib/lua/${LUAVERSION}' install
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 LICENSE
}
