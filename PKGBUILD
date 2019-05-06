# Maintainer: Lev Lybin <lev.lybin@gmail.com>
# Contributor: Lev Lybin <lev.lybin@gmail.com>

_npmname=cross-env
pkgname=nodejs-$_npmname
pkgver=5.2.0
pkgrel=1
pkgdesc="Node cross platform setting of environment scripts."
arch=('i686' 'x86_64')
url="https://github.com/kentcdodds/cross-env"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('0d6248a06117ecb7e1ab3e60d723a45afd769c7bfd639301817ee8e4558aa63f')

package() {
    cd "$srcdir"
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
