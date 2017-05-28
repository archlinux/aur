# Maintainer: Mario Finelli <mario at finel dot li>

_npmname=pug-cli
pkgname=nodejs-$_npmname
_pkgver=1.0.0-alpha6
pkgver=1.0.0alpha6
pkgrel=1
pkgdesc="Pug's CLI interface"
arch=('any')
url="https://pugjs.org"
license=('MIT')
depends=('nodejs' 'npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$_pkgver.tgz)
noextract=($_npmname-$_pkgver.tgz)
sha256sums=('1fc476f744776a477bfce64b88633176a84b3fd00a34cc3a3499a9aed2acca25')

package() {
    cd "$srcdir"
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$_pkgver
}
