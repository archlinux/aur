# Maintainer: Johannes Wienke <languitar@semipol.de>

_npmname=javascript-typescript-langserver
pkgname=nodejs-javascript-typescript-langserver
pkgver=2.5.5
pkgrel=1
pkgdesc='JavaScript and TypeScript language server implementation'
arch=('any')
url="https://github.com/sourcegraph/javascript-typescript-langserver"
license=('Apache')
depends=('npm' 'nodejs')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
md5sums=('ea2275bab8f2c0342ae970920d06fa94')

package() {
    cd "$srcdir"
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
