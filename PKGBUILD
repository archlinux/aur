# Contributor: Jonatan R. Fischer <jonafischer at gmail dot com>
pkgname=python-junit2html
_name=${pkgname#python-}
pkgver=30.1.6
pkgrel=1
pkgdesc="This is a simple self-contained python tool to produce a single html file from a single junit xml file."
arch=('any')
url="https://gitlab.com/inorton/junit2html"
license=('MIT')
depends=('python' 'python-jinja')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-setuptools-scm')

source=("${_name}-$pkgver.tar.gz::https://gitlab.com/inorton/junit2html/-/archive/v$pkgver/${_name}-v$pkgver.tar.gz")
sha256sums=('468922a29d4312f9e3c5f51d0f10e72beac5f4847c4e3a3f1d51a2b467ee2c69')

build() {
  cd $_name-v$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-v$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
