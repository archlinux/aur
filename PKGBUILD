# Maintainer: Geballin - Guillaume Ballin <macniaque at free dot fr>
# Contributor: Mario Finelli <mario at finel dot li>
# Contributor: Daniel Nagy <danielnagy at gmx dot de>
# Contributor: Remy Sharp <remy at remysharp dot com>

_npmname=nodemon
pkgname=nodejs-$_npmname
pkgver=3.1.10
pkgrel=1
pkgdesc="Simple monitor script for use during development of a node.js app."
arch=('any')
url="https://nodemon.io"
license=('MIT')
depends=(nodejs)
makedepends=(npm)
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz
        https://raw.githubusercontent.com/remy/nodemon/master/LICENSE)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('65de56af164063282f3c08fc683a978f7e9044fad91794d2473d8f72ff085a0d'
            '0fa6b5d2902f7ac42db390dfd2cb3b4ce82ed45cb5ad5dea41c11d1d67e0934d')

package() {
  npm install \
    --user root --global \
    --prefix "$pkgdir/usr" \
    "$srcdir"/$_npmname-$pkgver.tgz

  find "$pkgdir/usr" -type d -exec chmod 755 '{}' +

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
