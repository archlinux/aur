# Maintainer: 
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Felix Leblanc <felix.leblanc1305@gmail.com>
_npmname=generator-angular-fullstack
_npmver=5.0.0-rc.4
pkgname=nodejs-$_npmname
pkgver=5.0.0rc4
pkgrel=1
pkgdesc="Yeoman generator for AngularJS with an Express server http://yeoman.io"
arch=('any')
url="https://github.com/angular-fullstack/generator-angular-fullstack"
license=('BSD')
depends=('nodejs-yeoman')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=('9c18f50570e5ca797a0d1f1a4fce44c61c05c1d00b98a91b90b4220e42a22739')

package() {
    cd "$srcdir"
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
    rm -rf "$pkgdir"/usr/bin
    rm -rf "$pkgdir"/usr/lib/node_modules/{grunt-cli,bower,yo}
}
