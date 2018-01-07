# $Id: PKGBUILD 137223 2015-07-21 17:21:56Z anatolik $

pkgbase=lua-testmore
pkgname=(lua51-testmore lua52-testmore lua-testmore)
pkgver=0.3.2
pkgrel=1
arch=(any)
url='https://fperrad.github.io/lua-TestMore'
license=(MIT)
checkdepends=(lua)
source=(lua-testmore-$pkgver.tar.gz::https://github.com/fperrad/lua-TestMore/archive/$pkgver.tar.gz)
sha256sums=('893d1d963738b39d564f4e9adfd07c3176c2639d991c94fc9b3a8090440f7628')

package_lua51-testmore() {
  pkgdesc='Unit testing framework for Lua 5.1'
  depends=(lua51)

  cd lua-TestMore-${pkgver}
  make LUAVER=5.1 PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua52-testmore() {
  pkgdesc='Unit testing framework for Lua 5.2'
  depends=(lua52)

  cd lua-TestMore-$pkgver
  make LUAVER=5.2 PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua-testmore() {
  pkgdesc='Unit testing framework Lua 5.3'
  depends=(lua)

  cd lua-TestMore-$pkgver
  make LUAVER=5.3 PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

check() {
  cd lua-TestMore-$pkgver
  make check
}

