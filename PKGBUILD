# Maintainer: 	ngdngdc <2959471117 at qq dot com>

_npmname=wenku8
_npmver=5.1.0
pkgname=nodejs-wenku8-downloader # All lowercase
pkgver=5.1.0
pkgrel=1
pkgdesc="Resumable Wenku8 novel downloader and EPUB 3 builder"
arch=(any)
url="https://github.com/Messiahhh/wenku8-downloader#readme"
license=(MIT)
depends=('nodejs' 'npm')
optdepends=()
source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${_npmver}.tgz")
noextract=(${_npmname}-${_npmver}.tgz)
sha1sums=('86e439317d72b244808c6a7b3547356258fa35b8')

package() {
    cd $srcdir
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p $_npmdir
    cd $_npmdir
    npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
    chown -R root:root "$pkgdir"
}

# vim:set ts=2 sw=2 et:
