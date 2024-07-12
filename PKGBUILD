# Maintainer: 	ngdngdc <2959471117 at qq dot com>

_npmname=wenku8
_npmver=4.0.0
pkgname=nodejs-wenku8-downloader # All lowercase
pkgver=4.0.0
pkgrel=1
pkgdesc="轻小说文库下载器"
arch=(any)
url="https://github.com/Messiahhh/wenku8-downloader#readme"
license=(MIT)
depends=('nodejs' 'npm')
optdepends=()
source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${_npmver}.tgz")
noextract=(${_npmname}-${_npmver}.tgz)
sha1sums=('b5734d16323c1f1305b14b045f7df67fcc80ab3c')

package() {
    cd $srcdir
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p $_npmdir
    cd $_npmdir
    npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
    chown -R root:root "$pkgdir"
}

# vim:set ts=2 sw=2 et:
