# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Anatol Pomozov

pkgname=python-tarantool
pkgver=0.9.0
pkgrel=1
pkgdesc='Python client library for Tarantool 1.6 Database'
arch=('any')
url='https://github.com/tarantool/tarantool-python'
license=('BSD')
depends=('python' 'python-msgpack' 'python-yaml' 'python-six')
makedepends=('python-setuptools' 'git')
checkdepends=('tarantool' 'python-dbapi-compliance')
source=("https://pypi.io/packages/source/t/tarantool/tarantool-$pkgver.tar.gz")
sha512sums=('04fa32ccaa21a8171926b2486e3522ba9ede8a077f439a2022f1adf2f664f9ac5c980e2982be6c976a9d36d37637432401c18ad54ec39f1ce13ec9be73684aea')

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
