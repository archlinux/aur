# Maintainer: 	whitels <2959471117 at qq dot com>

_npmname=wenku8
_npmver=3.5.0
_npmrel=1
pkgname=nodejs-wenku8-downloader # All lowercase
pkgver=3.5.0
pkgrel=1
pkgdesc="轻小说文库下载器"
arch=(any)
url="https://github.com/Messiahhh/wenku8-downloader#readme"
license=(MIT)
depends=('nodejs' 'npm')
optdepends=()
source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${_npmver}.tgz")
noextract=($_npmname-$_npmver.tgz)
sha1sums=('a6b7aa573520fe3d29d7258d4f3d9b6ea72c62ff')

package() {
    cd $srcdir
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p $_npmdir
    cd $_npmdir
    npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
    chown -R root:root "$pkgdir"
}

# vim:set ts=2 sw=2 et:
