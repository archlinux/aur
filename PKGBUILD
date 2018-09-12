# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Joseph Brains <jnbrains@gmail.com>

_pkgname=aiohttp
pkgname=python-"$_pkgname"-gns3
pkgver=2.3.9
pkgrel=1
pkgdesc='Asynchronous HTTP Client/Server for asyncio and Python'
arch=('any')
url="https://aiohttp.readthedocs.io/"
license=('Apache')
groups=('gns3')
depends=('python' 'python-yarl' 'python-chardet' 'python-multidict-gns3' 'python-async-timeout-gns3')
makedepends=('python-setuptools')
provides=("python-$_pkgname")
conflicts=("python-$_pkgname")
source=("$pkgname-$pkgver.tar.gz::https://github.com/aio-libs/$_pkgname/archive/v$pkgver.tar.gz")
sha256sums=('3044eed412a7100ba5c9ef61a06e0264ae159a4cb007339e0e98812dd45ae83d')

build() {
    cd "$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
