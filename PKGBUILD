# Maintainer: Mario Finelli <mario dot finelli at yahoo dot com>
# Contributor: Alexis Sellier <self at cloudhead dot net>
# Contributor: Charlie Robbins <charlie dot robbins at gmail dot com>
# Contributor: Maciej Malecki <maciej dot malecki at notimplemented dot org>
# Contributor: Jerry Sievert <code at legitimatesounding dot com>

_npmname=vows
pkgname=nodejs-$_npmname
pkgver=0.8.1
pkgrel=3
pkgdesc="Asynchronous BDD & continuous integration for node.js."
arch=('any')
url="http://vowsjs.org"
license=('MIT')
depends=('nodejs' 'npm')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('25c5eaaffa7daf403d4973f128bf9a6da45dd0ec9670eb4281b7451a8d3547d9')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
