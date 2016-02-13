# Maintainer: Felix Leblanc <felix.leblanc1305@gmail.com>
_npmname=generator-angular-fullstack
_npmver=3.3.0
pkgname=nodejs-$_npmname
pkgver=3.3.0
pkgrel=1
pkgdesc="Yeoman generator for AngularJS with an Express server http://yeoman.io"
arch=('any')
url="https://github.com/angular-fullstack/generator-angular-fullstack"
license=('BSD')
depends=('nodejs-yeoman')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
md5sums=('e9caff7275fd41664be7d18e88800eea')

package() {
    cd "$srcdir"
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
    rm -rf "$pkgdir"/usr/bin
    rm -rf "$pkgdir"/usr/lib/node_modules/{grunt-cli,bower,yo}
}
