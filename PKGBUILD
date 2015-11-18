# Maintainer: Maxime Poulin <maxpoulin64@gmail.com>
# Contributor: Joris Steyn <jorissteyn@gmail.com>

_npmname=requirejs
pkgname=nodejs-requirejs
pkgver=2.1.20
pkgrel=1
pkgdesc="Node.js adapter for RequireJS"
arch=(any)
url="http://github.com/jrburke/r.js"
license=('BSD' 'MIT')
depends=('nodejs')
optdepends=()
source=("http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
md5sums=('eb865548683a44422594629206ddf04b')
noextract=($_npmname-$pkgver.tgz)

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" "$srcdir"/$_npmname-$pkgver.tgz

  # remove references to srcdir
  sed -i "s|$srcdir|/tmp|g" "$pkgdir"/usr/lib/node_modules/requirejs/package.json
}
# vim:set ts=2 sw=2 et:
