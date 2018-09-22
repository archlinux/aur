# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname='python-indexedredis'
pkgver=6.0.3
pkgrel=2
pkgdesc="A super-fast ORM backed by Redis, supporting models and indexes with O(1) searches, and support for storing native/complex types and objects"
arch=('any')
license=('LGPLv2')
url="http://github.com/kata198/IndexedRedis"
makedepends=('python-setuptools' 'python-queryablelist' 'python-redis')
depends=('python-setuptools' 'python-queryablelist' 'python-redis')

source=("https://github.com/kata198/indexedredis/archive/${pkgver}.tar.gz")
sha512sums=('6179dd7bd01b2c4f937eb5d824f71cf92801c41f4ae0b3dcf1bd6568bde2ba50aa28d8c2d16bdda32b3fdcd1464e72bc490489436a6ec943d7e715dc46db7ab2')

build() {
  cd "$srcdir"/indexedredis-$pkgver
  python setup.py build

}

package() {
  cd indexedredis-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

