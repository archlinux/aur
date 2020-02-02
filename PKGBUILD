# Maintainer: Lev Lybin <lev.lybin@gmail.com>
# Contributor: Lev Lybin <lev.lybin@gmail.com>

_npmname=cross-env
pkgname=nodejs-$_npmname
pkgver=7.0.0
pkgrel=1
pkgdesc="Node cross platform setting of environment scripts."
arch=('i686' 'x86_64')
url="https://github.com/kentcdodds/cross-env"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('4df786cc186198073a21810c43c82ce029329afa5e751f402ca9b0967aec1bc5')

package() {
    cd "$srcdir"
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
