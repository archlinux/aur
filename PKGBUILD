# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor:  Joseph Brains <jnbrains@gmail.com>

_pkgname=aiohttp-cors
pkgname=python-"$_pkgname"-gns3
pkgver=0.6.0
pkgrel=1
pkgdesc="CORS support for aiohttp (GNS3)"
arch=("any")
url="https://github.com/aio-libs/$_pkgname"
license=('Apache')
groups=('gns3')
depends=('python' 'python-aiohttp-gns3')
makedepends=('python-setuptools')
provides=("python-$_pkgname")
conflicts=("python-$_pkgname")
source=("$_pkgname-$pkgver.tar.gz::https://github.com/aio-libs/$_pkgname/archive/v$pkgver.tar.gz")
sha256sums=('b5dab373e0666836526a3c7a6cf8f887e75559e05d0e836cb9fb233958145e9c')

build() {
    cd "$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
