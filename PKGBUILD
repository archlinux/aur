# Maintainer: Mario Finelli <mario at finel dot li>

_npmname=postcss-cli
pkgname=nodejs-$_npmname
pkgver=6.0.0
pkgrel=1
pkgdesc="Traditional CLI for postcss."
arch=('any')
url="https://github.com/code42day/postcss-cli"
license=('MIT')
depends=('nodejs')
makedepends=(npm)
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('28eaf135eb187f880198bf2422e54321d15759af10c65734a6fff460de5c7cc2')

package() {
  npm install \
    --user root --global \
    --prefix "$pkgdir/usr" \
    "$srcdir"/$_npmname-$pkgver.tgz

  find "$pkgdir/usr" -type d -exec chmod 755 '{}' +

  install -Dm0644 "$pkgdir/usr/lib/node_modules/$_npmname/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
