# Maintainer: Felix Leblanc <felix.leblanc1305@gmail.com>
_npmname=node-gyp
pkgname=nodejs-gyp
pkgver=3.2.1
pkgrel=1
pkgdesc="Node.js native addon build tool"
arch=('any')
url="https://github.com/nodejs/node-gyp"
license=('MIT')
groups=()
depends=('python2' 'nodejs' 'npm')
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=("$_npmname-$pkgver.tgz")
md5sums=('d24abfededda7a1d2da314a725d4fbd3')

package() {
    cd "$srcdir"
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install --no-optional --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
