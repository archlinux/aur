# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Joseph Brains <jnbrains@gmail.com>

_pkgname=aiohttp
pkgname=python-"$_pkgname"-gns3
pkgver=3.6.2
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
sha256sums=('4ad2d8393843ea0c7b50a93bf04fb1cf20b93c0a5e958de128efcd2e5f8adf80')

build() {
    cd "$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
