# Maintainer: dringsim <dringsim@qq.com>
# Contributor: geearf

pkgname=python-aiocache
_name="${pkgname#python-}"
pkgver=0.12.3
pkgrel=1
pkgdesc="Asyncio cache manager for redis, memcached and memory"
arch=(any)
url="https://github.com/argaen/aiocache"
license=('BSD')
makedepends=('python-setuptools')
depends=('python')
optdepends=('python-aiomcache' 'python-msgpack' 'python-redis' 'python-ujson')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('f528b27bf4d436b497a1d0d1a8f59a542c153ab1e37c3621713cb376d44c4713')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
