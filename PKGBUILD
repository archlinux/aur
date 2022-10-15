_npmname=whistle
_npmver=2.9.31
pkgname=nodejs-whistle # All lowercase
pkgver=2.9.31
pkgrel=1
pkgdesc="HTTP, HTTP2, HTTPS, Websocket debugging proxy"
arch=(any)
url="https://github.com/avwo/whistle"
license=(MIT)
depends=('nodejs' 'npm')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(b881eae4eed1e28aef5fd6de2e4d7dcef964e2d5)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
  chown -R root:root "$pkgdir"
}

# vim:set ts=2 sw=2 et:
