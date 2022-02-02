# Maintainer: HLFH <gaspard@dhautefeuille.eu>

pkgname=python-redis-ng
pkgver=4.1.2
pkgrel=1
pkgdesc='The Python interface to the Redis key-value store'
arch=('any')
url="https://github.com/redis/redis-py"
license=('MIT')
depends=('python' 'python-deprecated')
makedepends=('python-setuptools')
conflicts=('python-redis')
source=("https://pypi.io/packages/source/r/redis/redis-$pkgver.tar.gz")
sha512sums=('beb6e50051eae61e84e7cf37f9f3e3efbc404d49e506b0b3bdae0d0c45fd940f12c801434a6394505519bf327b5933c076ad4f8c66ad812441bc08b3aa682542')

build() {
  cd "$srcdir"/redis-$pkgver
  python setup.py build
}

package() {
  cd redis-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
