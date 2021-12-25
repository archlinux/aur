# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Anatol Pomozov

pkgname=python-tarantool
pkgver=0.7.1
pkgrel=1
pkgdesc='Python client library for Tarantool 1.6 Database'
arch=('any')
url='https://github.com/tarantool/tarantool-python'
license=('BSD')
depends=('python' 'python-msgpack' 'python-yaml' 'python-six')
makedepends=('python-setuptools' 'git')
checkdepends=('tarantool' 'python-dbapi-compliance')
source=("https://pypi.io/packages/source/t/tarantool/tarantool-$pkgver.tar.gz")
sha512sums=('8d2fd8076666869f70384985e8237a7eefbbddd5ef749fde51f4c64c08e88d6632060f69d7bc8c811919c5468df54a051292db7396adf1df5b5abfeb0a35847e')

#prepare() {
#  sed -i 's/msgpack-python/msgpack/g' tarantool-$pkgver/setup.py
#}

build() {
  cd tarantool-$pkgver
  python setup.py build
}

check() {
  cd tarantool-$pkgver
  python setup.py test
}

package() {
  cd tarantool-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
