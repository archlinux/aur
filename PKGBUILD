# Maintainer: Mario Finelli <mario at finel dot li>

_npmname=clean-css
pkgname=nodejs-$_npmname
pkgver=4.1.11
pkgrel=1
pkgdesc="A fast, efficient, and well tested CSS minifier for node.js."
arch=('any')
url="https://github.com/jakubpawlowicz/clean-css"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('7c00a726fad4e59d383af5f665b993e0ee9917bfb702c488e28db80901e37052')

package() {
  npm install \
    --user root --global \
    --prefix "$pkgdir/usr" \
    "$srcdir"/$_npmname-$pkgver.tgz

  find "$pkgdir/usr" -type d -exec chmod 755 '{}' +

  install -Dm0644 "$pkgdir/usr/lib/node_modules/$_npmname/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
