# Maintainer: Mario Finelli <mario at finel dot li>

_npmname=foundation-cli
pkgname=nodejs-$_npmname
pkgver=2.1.0
pkgrel=1
pkgdesc="Command-line interface for the Foundation family of frameworks."
arch=('any')
url="http://foundation.zurb.com/"
license=('MIT')
depends=('nodejs' 'npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('eb14342835eca949729eefa1554a509ce9c70d8d035124d2470437b3c929be5a')

package() {
    cd "$srcdir"
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
