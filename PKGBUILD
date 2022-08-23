# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Anatol Pomozov

pkgname=python-tarantool
pkgver=0.8.0
pkgrel=1
pkgdesc='Python client library for Tarantool 1.6 Database'
arch=('any')
url='https://github.com/tarantool/tarantool-python'
license=('BSD')
depends=('python' 'python-msgpack' 'python-yaml' 'python-six')
makedepends=('python-setuptools' 'git')
checkdepends=('tarantool' 'python-dbapi-compliance')
source=("https://pypi.io/packages/source/t/tarantool/tarantool-$pkgver.tar.gz")
sha512sums=('3d61737a476e956911cef86131938f0c29c8cbf8e19a8ab8b39d1bf6f7c1518c102326e8bc8eb7a6c18c7549355a15de3ad4be70925cae02eefdff792fb94d0a')

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
