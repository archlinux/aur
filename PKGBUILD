# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Daniel Nagy <danielnagy at gmx dot de>
# Contributor: Remy Sharp <remy at remysharp dot com>

_npmname=nodemon
pkgname=nodejs-$_npmname
pkgver=2.0.6
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
sha256sums=('b2ca78dddcf2e2ba41e523c37e85c368cc69a6601cf2de1e5d08dce787ca7b43'
            '06b39793ed39069c1ec56005ae6953db02dc3a8f5221ccced91443ec5912501e')

package() {
  npm install \
    --user root --global \
    --prefix "$pkgdir/usr" \
    "$srcdir"/$_npmname-$pkgver.tgz

  find "$pkgdir/usr" -type d -exec chmod 755 '{}' +

  install -Dm0644 license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
