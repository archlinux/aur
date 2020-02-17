# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Daniel Nagy <danielnagy at gmx dot de>
# Contributor: Remy Sharp <remy at remysharp dot com>

_npmname=nodemon
pkgname=nodejs-$_npmname
pkgver=2.0.2
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
sha256sums=('3eba3c823a387f964b2e8f5daed1bf13402b17a46aeb3c019a0cc4f5292a6d45'
            '22a451857919b5b20b64977023047477b2f4ec872ecfd538893a544e5634f5c5')

package() {
  npm install \
    --user root --global \
    --prefix "$pkgdir/usr" \
    "$srcdir"/$_npmname-$pkgver.tgz

  find "$pkgdir/usr" -type d -exec chmod 755 '{}' +

  install -Dm0644 license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
