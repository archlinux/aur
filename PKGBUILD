# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Joseph Brains <jnbrains@gmail.com>

_pkgname=aiohttp
pkgname=python-"$_pkgname"-gns3
pkgver=3.5.4
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
sha256sums=('9385ff2ea20249be9119236b3367356465cb92dc55b463d12239c7cf36024bba')

build() {
    cd "$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
