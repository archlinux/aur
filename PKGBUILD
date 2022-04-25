# Maintainer: brodokk <brodokk at brodokk dot space>

_pkgname=duniterpy
pkgname=python-$_pkgname

pkgver=1.1.0
pkgrel=1
pkgdesc="Python APIs library to implement Duniter clients software"

url='https://git.duniter.org/clients/python/duniterpy'
arch=('any')
license=('GPL3')

provides=('duniterpy')

depends=('python' 'python-aiohttp' 'python-scrypt' 'python-libnacl' 'python-base58' 'attr')
makedepends=(python-build python-installer python-wheel)

source=("https://git.duniter.org/clients/python/$_pkgname/-/archive/$pkgver/$_pkgname-$pkgver.tar.gz")
sha512sums=('3d11af4ed758cf8dd51691eadd3e57a6230d95622ea0e13aee05f153ab82e150c0efe30ca31f8c664ca35d2b112847ae44faa98abfc5e45a873537f196fd11c6')

build() {
    cd $_pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
