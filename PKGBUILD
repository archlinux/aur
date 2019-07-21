# Maintainer: Simon Legner <Simon.Legner@gmail.com>
# Contributor: Daniel Nagy <danielnagy at gmx de>
# Contributor: Einar Otto Stangvik <einaros@gmail.com> (http://2x.io)
# Contributor: einaros <einaros@gmail.com>
# Contributor: V1 <info@3rd-Eden.com>

_npmname=ws
pkgname=nodejs-ws
pkgver=7.1.1
pkgrel=1
pkgdesc="Simple to use, blazing fast and thoroughly tested WebSocket client and server for Node.js"
arch=(any)
url="https://github.com/websockets/ws"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
sha256sums=('9fb5eeffefac35b85a0a73cc450b9ae240771853883c9a3bd71422d024266b39')

package() {
  npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"
  find "${pkgdir}"/usr -type d -exec chmod 755 {} +
  install -Dm644 "$srcdir/package/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
