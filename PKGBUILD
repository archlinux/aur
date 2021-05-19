# Contributor: Carlo Cabanilla <carlo.cabanilla@gmail.com>

_npmname=jsfmt
pkgname=nodejs-$_npmname
pkgver=0.5.3
pkgrel=1
pkgdesc="gofmt for javascript"
arch=(any)
url=http://rdio.github.io/jsfmt/
license=(Apache)
depends=('nodejs' 'npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('ce2cc70648bd96c1552d3ba7fd10cba16bbf4d3004fb42ecf17a3eba75a1b33c')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
