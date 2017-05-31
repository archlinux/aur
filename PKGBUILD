# Maintainer: Charles Heywood <charles@hashbang.sh>
pkgname=('lua-ossl-git' 'lua51-ossl-git' 'lua52-ossl-git')
pkgver=20161214.r43.a91aba8
pkgrel=4
arch=('i686' 'x86_64')
url="http://25thandclement.com/~william/projects/luaossl.html"
license=('MIT')
makedepends=('git' 'openssl')
source=('git+https://github.com/wahern/luaossl.git#branch=master')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/luaossl"
  git describe --tags --long | sed "s/^[^-]*-//;s/\([^-]*-\)g/r\1/;s/-/./g"
}

build() {
  cd "$srcdir/luaossl"
  make prefix=/usr
}

package_lua-ossl-git() {
  pkgdesc="Most comprehensive OpenSSL module in the Lua universe for Lua 5.3"

  cd luaossl
  make DESTDIR="$pkgdir" prefix=/usr install5.3
  install -Dm644 LICENSE "$pkgdir"/usr/share/license/$pkgname/LICENSE
}

package_lua51-ossl-git() {
  pkgdesc="Most comprehensive OpenSSL module in the Lua universe for Lua 5.1"

  cd luaossl
  make DESTDIR="$pkgdir" prefix=/usr install5.1
  install -Dm644 LICENSE "$pkgdir"/usr/share/license/$pkgname/LICENSE
}

package_lua52-ossl-git() {
  pkgdesc="Most comprehensive OpenSSL module in the Lua universe for Lua 5.1"

  cd luaossl
  make DESTDIR="$pkgdir" prefix=/usr install5.2
  install -Dm644 LICENSE "$pkgdir"/usr/share/license/$pkgname/LICENSE
}
# vim:set et sts=0 sw=2 ts=2:
