
pkgname=nodejs-configurable-http-proxy
pkgver=0.3.0
pkgrel=1
pkgdesc="node-http-proxy plus a REST API"
url="https://github.com/jupyter/configurable-http-proxy"
arch=(any)
license=('BSD')
depends=('nodejs')
source=("https://github.com/jupyter/configurable-http-proxy/archive/${pkgver}.tar.gz")
md5sums=('c53a6293a38d0f69a21bb10e48d9f2ad')
_npmname=configurable-http-proxy

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver

  rm -rf "$pkgdir/usr/etc"
  chown -R root:root "$pkgdir/usr"
  cd "$srcdir/$_npmname-$pkgver"
  install -Dm644 COPYING.md "${pkgdir}"/usr/share/licenses/$pkgname/COPYING.md
}

