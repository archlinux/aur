# Maintainer: Mario Finelli <mario at finel dot li>

_npmname=express-generator
pkgname=nodejs-$_npmname
pkgver=4.16.0
pkgrel=1
pkgdesc="Express' application generator."
arch=('any')
url="http://expressjs.com"
license=('MIT')
depends=('nodejs')
makedepends=(npm)
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('51cc89db33fae44743d8efe674e6bc0b48b920ae8a58737d03181eedba37f565')

package() {
  npm install \
    --user root --global \
    --prefix "$pkgdir/usr" \
    "$srcdir"/$_npmname-$pkgver.tgz

  find "$pkgdir/usr" -type d -exec chmod 755 '{}' +

  install -Dm0644 "$pkgdir/usr/lib/node_modules/$_npmname/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
