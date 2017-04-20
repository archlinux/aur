# Maintainer: Caleb Maclennan <caleb@alerque.com>

_npmname=csscomb
pkgname=nodejs-$_npmname
pkgver=4.0.1
pkgrel=1
pkgdesc="Coding style formatter for CSS"
arch=('any')
url="https://github.com/csscomb/csscomb.js"
license=('MIT')
depends=(
        'nodejs'
        'npm'
)
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
sha256sums=('8276a874964d5a5f36a658a07e2c14988cb248f5902654a4d000b1c28866e3c6')
noextract=($_npmname-$pkgver.tgz)

package() {
        cd "$srcdir"
        local _npmdir="$pkgdir/usr/lib/node_modules/"
        mkdir -p "$_npmdir"
        cd "$_npmdir"
        npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
