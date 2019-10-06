# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor:  Joseph Brains <jnbrains@gmail.com>

_pkgname=aiohttp-cors
pkgname=python-"$_pkgname"-gns3
pkgver=0.7.0
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
sha256sums=('a710a07c3d8e8c2dcb3a3f992c671a058e2058652ed041b5201016978a5527aa')

build() {
    cd "$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
