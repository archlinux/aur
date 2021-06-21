# Maintainer: Simon Legner <Simon.Legner@gmail.com>
# Contributor: Daniel Nagy <danielnagy at gmx de>
# Contributor: Einar Otto Stangvik <einaros@gmail.com> (http://2x.io)
# Contributor: einaros <einaros@gmail.com>
# Contributor: V1 <info@3rd-Eden.com>

_npmname=ws
pkgname=nodejs-ws
pkgver=7.5.0
pkgrel=1
pkgdesc="Simple to use, blazing fast and thoroughly tested WebSocket client and server for Node.js"
arch=(any)
url="https://github.com/websockets/ws"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
sha256sums=('d97a358b73315effa0da96d7eb73a9d852d64a5fa9b5ca31fa51bef6e281848e')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  chown -R root:root "${pkgdir}"
  install -Dm644 "$srcdir/package/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
