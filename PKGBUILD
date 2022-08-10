# Maintainer: Aaron Coach <aur at ezpz dot cz>

_npmname=acme-client
_npmver=4.2.5
pkgname=nodejs-acme-client
pkgver=4.2.5
pkgrel=1
pkgdesc="A simple and unopinionated ACME client."
arch=(any)
url="https://github.com/publishlab/node-acme-client"
license=(MIT)
makedepends=('npm')
depends=('nodejs<18.1.0')
optdepends=()
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz")
noextract=("$_npmname-$_npmver.tgz")
sha256sums=('4b5f4838e937e38f44ab80d80b2452f774a1d61c5fcbc2fe85303faf9b9fc0d2')

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
