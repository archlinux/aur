# Maintainer: Aaron Coach <aur at ezpz dot cz>

_npmname=modern-syslog
_npmver=1.2.0
pkgname=nodejs-modern-syslog
pkgver=1.2.0
pkgrel=1
pkgdesc="modern syslog - streaming, async, native, uses nan"
arch=(any)
url="https://github.com/strongloop/modern-syslog"
license=(MIT)
makedepends=('npm')
depends=('nodejs<18.1.0')
optdepends=()
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz")
noextract=("$_npmname-$_npmver.tgz")
sha256sums=('052b6265b24efcf36369f91aead98e184ffd35152b5e93c900c7b051f978a58f')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
