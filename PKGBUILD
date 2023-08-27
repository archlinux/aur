# Maintainer: Dringsim <dringsim@qq.com>
# Contributor: geearf

pkgname=python-aiocache
_name="${pkgname#python-}"
pkgver=0.12.2
pkgrel=1
pkgdesc="Asyncio cache manager for redis, memcached and memory"
arch=(any)
url="https://github.com/argaen/aiocache"
license=('BSD')
makedepends=('python-setuptools')
depends=('python')
optdepends=('python-aiomcache' 'python-aioredis' 'python-msgpack' 'python-redis' 'python-ujson')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('b41c9a145b050a5dcbae1599f847db6dd445193b1f3bd172d8e0fe0cb9e96684')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
