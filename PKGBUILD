# Maintainer: Mario Finelli <mario at finel dot li>

_npmname=sails
pkgname=nodejs-$_npmname
pkgver=1.1.0
pkgrel=1
pkgdesc="Realtime MVC Framework for Node.js."
arch=('any')
url="http://sailsjs.org"
license=('MIT')
depends=(nodejs)
makedepends=(npm)
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('0a852bc9cde80147c3da6657a48d879f75a23aacd3e088ec6dea885e83cbc31f')

package() {
  npm install \
    --user root --global \
    --prefix "$pkgdir/usr" \
    "$srcdir"/$_npmname-$pkgver.tgz

  find "$pkgdir/usr" -type d -exec chmod 755 '{}' +

  install -Dm0644 "$pkgdir/usr/lib/node_modules/$_npmname/LICENSE.md" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
