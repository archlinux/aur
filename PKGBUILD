# $Id: PKGBUILD 198064 2016-12-05 19:20:57Z anatolik $
# Contributor: Florian Walch <florian+aur@fwalch.com>
# Contributor: Florian Hahn <flo@fhahn.com>

pkgbase=lua-messagepack
pkgname=(lua51-messagepack lua52-messagepack lua-messagepack)
pkgver=0.3.7
pkgrel=1
arch=(any)
url='https://fperrad.github.io/lua-MessagePack'
license=(MIT)
checkdepends=(lua lua-testmore)
source=(lua-messagepack-$pkgver.tar.gz::https://github.com/fperrad/lua-MessagePack/archive/$pkgver.tar.gz)
sha256sums=('e20606256c1a228158ea8e47bea8a964a1ea1b77f3120d6eba34ee4bf0eec623')

package_lua51-messagepack() {
  pkgdesc='Implementation of MessagePack spec v5 for Lua 5.1'
  depends=(lua51)

  cd lua-MessagePack-${pkgver}
  make LUAVER=5.1 PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua52-messagepack() {
  pkgdesc='Implementation of MessagePack spec v5 for Lua 5.2'
  depends=(lua52)

  cd lua-MessagePack-$pkgver
  make LUAVER=5.2 PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua-messagepack() {
  pkgdesc='Implementation of MessagePack spec v5 for Lua 5.3'
  depends=(lua)

  cd lua-MessagePack-$pkgver
  make LUAVER=5.3 PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

check() {
  cd lua-MessagePack-$pkgver
  make check
}

