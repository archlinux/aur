# Maintainer: Luca P <meti at lplab.net>

pkgbase=luajson
pkgname=(lua-luajson lua51-luajson lua52-luajson)
pkgver=1.3.4
pkgrel=1
arch=('any')
url='http://luaforge.net/projects/luajson/'
license=('MIT')
makedepends=('lua-lpeg' 'lua51-lpeg' 'lua52-lpeg')
source=(https://github.com/harningt/$pkgbase/archive/$pkgver.tar.gz)
md5sums=('66ef8d00bcaeec91b25433a697090bc8')

package_lua-luajson() {
  pkgdesc='JSON parser/encoder for Lua'
  depends=('lua-lpeg')

  cd $pkgbase-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" \
    INSTALL_LMOD='$(INSTALL_TOP)/share/lua/5.3' \
    INSTALL_CMOD='$(INSTALL_TOP)/lib/lua/5.3' install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_lua51-luajson() {
  pkgdesc='JSON parser/encoder for Lua 5.1'
  depends=('lua51-lpeg')

  cd $pkgbase-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" \
    INSTALL_LMOD='$(INSTALL_TOP)/share/lua/5.1' \
    INSTALL_CMOD='$(INSTALL_TOP)/lib/lua/5.1' install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_lua52-luajson() {
  pkgdesc='JSON parser/encoder for Lua 5.2'
  depends=('lua52-lpeg')

  cd $pkgbase-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" \
    INSTALL_LMOD='$(INSTALL_TOP)/share/lua/5.2' \
    INSTALL_CMOD='$(INSTALL_TOP)/lib/lua/5.2' install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
