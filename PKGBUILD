# Maintainer: Mario Finelli <mario at finel dot li>

_npmname=postcss-cli
pkgname=nodejs-$_npmname
pkgver=7.1.2
pkgrel=1
pkgdesc="Traditional CLI for postcss."
arch=('any')
url="https://github.com/code42day/postcss-cli"
license=('MIT')
depends=('nodejs')
makedepends=(npm)
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('0da1749e30bc60d3a833a7e8d1b275ff97d8c2b4d02b7091b28b8f5f6403c503')

package() {
  npm install \
    --user root --global \
    --prefix "$pkgdir/usr" \
    "$srcdir"/$_npmname-$pkgver.tgz

  find "$pkgdir/usr" -type d -exec chmod 755 '{}' +

  install -Dm0644 "$pkgdir/usr/lib/node_modules/$_npmname/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
