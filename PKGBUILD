# Maintainer: geearf

pkgname=python-aiocache
pkgver=0.11.1
pkgrel=1
pkgdesc="Asyncio cache manager for redis, memcached and memory"
arch=(any)
url="https://github.com/argaen/aiocache"
license=('BSD')
makedepends=('python-setuptools')
depends=('python')
optdepends=('python-aioredis' 'python-ujson')
source=("https://github.com/argaen/aiocache/archive/${pkgver}.tar.gz")
md5sums=('3cb8e4b0934a845f7ae4dc9b78c4b560')

build() {
    cd "${srcdir}/aiocache-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/aiocache-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
}
