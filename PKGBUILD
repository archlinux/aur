# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Daniel Nagy <danielnagy at gmx dot de>
# Contributor: Remy Sharp <remy at remysharp dot com>

_npmname=nodemon
pkgname=nodejs-$_npmname
pkgver=1.18.4
pkgrel=1
pkgdesc="Simple monitor script for use during development of a node.js app."
arch=('any')
url="https://nodemon.io"
license=('MIT')
depends=(nodejs)
makedepends=(npm)
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz
        https://rem.mit-license.org/license.txt)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('8d665c1e60e72aa9f96b82ecf74e749e81a0cf9def1dd17e37002784c75f6fcf'
            '7604b688103461ec6a1d50921c26aa32a2384940ab9f1c1f64963122ecb957ce')

package() {
  npm install \
    --user root --global \
    --prefix "$pkgdir/usr" \
    "$srcdir"/$_npmname-$pkgver.tgz

  find "$pkgdir/usr" -type d -exec chmod 755 '{}' +

  install -Dm0644 license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
