# Maintainer: Gustavo Vinícios de Souza <gnsfujiwara@disroot.org>

_npmname=xdccjs
_npmver=5.1.5
pkgname=nodejs-xdccjs
pkgver=5.1.5
pkgrel=1
pkgdesc="download files from XDCC bots on IRC, complete implementation of the XDCC protocol"
arch=('any')
url="https://github.com/JiPaix/xdccJS"
license=('MIT')
depends=('nodejs' 'npm')
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz")
noextract=("$_npmname-$_npmver.tgz")
sha1sums=('246798e14c0cba4f85a8c78ca395503638acd753')

package() {
    cd "$srcdir"
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install -g --prefix "$pkgdir/usr" "$_npmname@$_npmver"
    chown -R root:root "$pkgdir"
}
