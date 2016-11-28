# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: Nodejitsu Inc. <info@nodejitsu.com>
# Contributor: indexzero <charlie.robbins@gmail.com>
# Contributor: bradleymeck <bradley.meck@gmail.com>
# Contributor: avianflu <charlie@charlieistheman.com>
# Contributor: mmalecki <me@mmalecki.com>

_npmname=forever
pkgname=nodejs-forever # All lowercase
pkgver=0.15.3
pkgrel=1
pkgdesc="A simple CLI tool for ensuring that a given node script runs continuously (i.e. forever)"
arch=(any)
url="http://github.com/nodejitsu/forever"
license=()
depends=('nodejs' )
makedepends=('npm')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha1sums=('77d9d7e15fd2f511ad9d84a110c7dd8fc8ecebc2')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}

# vim:set ts=2 sw=2 et:
