# Maintainer: Geballin - Guillaume Ballin <macniaque at free dot fr>
# Contributor: Mario Finelli <mario at finel dot li>
# Contributor: Daniel Nagy <danielnagy at gmx dot de>
# Contributor: Remy Sharp <remy at remysharp dot com>

_npmname=nodemon
pkgname=nodejs-$_npmname
pkgver=2.0.7
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
sha256sums=('ae1a367be30c902bcfcd7b0ddad2b7002841b98d06af1c084bd6d1319b8a3585'
            '0fa6b5d2902f7ac42db390dfd2cb3b4ce82ed45cb5ad5dea41c11d1d67e0934d')

package() {
  npm install \
    --user root --global \
    --prefix "$pkgdir/usr" \
    "$srcdir"/$_npmname-$pkgver.tgz

  find "$pkgdir/usr" -type d -exec chmod 755 '{}' +

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
