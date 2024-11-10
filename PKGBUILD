# Contributor: Jonatan R. Fischer <jonafischer at gmail dot com>
pkgname=python-junit2html
_name=${pkgname#python-}
pkgver=31.0.2
pkgrel=1
pkgdesc="This is a simple self-contained python tool to produce a single html file from a single junit xml file."
arch=('any')
url="https://gitlab.com/inorton/junit2html"
license=('MIT')
depends=('python' 'python-jinja')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-setuptools-scm')

source=("${_name}-$pkgver.tar.gz::https://gitlab.com/inorton/junit2html/-/archive/v$pkgver/${_name}-v$pkgver.tar.gz")
sha256sums=('8d90ae83163dde6bf0bde9c3e8d21c0ab0796de7c5f33917cfdbb9d319212213')

build() {
  cd $_name-v$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-v$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
