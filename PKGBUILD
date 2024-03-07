# Contributor: Jonatan R. Fischer <jonafischer at gmail dot com>
pkgname=python-junitparser
_name=${pkgname#python-}
pkgver=3.1.2
pkgrel=1
pkgdesc="junitparser handles JUnit/xUnit Result XML files. Use it to parse and manipulate existing Result XML files, or create new JUnit/xUnit result XMLs from scratch."
arch=('any')
url="https://github.com/weiwei/junitparser"
license=('Apache 2.0')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-setuptools-scm')

source=("${_name}-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('d37ca5b35569dd7ebfdee976f2396b7d95cc46aa3c5910a0a7771c80751a5524')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
