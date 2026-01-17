# Maintainer: NihilDigit <starse.nd233@gmail.com>

pkgname=python-json-five
pkgver=1.1.2
pkgrel=1
pkgdesc='JSON5 parsing with round-trip editing support'
arch=('any')
url='https://pypi.org/project/json-five/'
license=('MIT')
depends=('python' 'python-regex' 'python-sly')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/1a/b1/3f9e2feb61fc7d78fa6cf584477416e75ea9c9b4796a62ace787539c9a04/json_five-${pkgver}.tar.gz")
sha256sums=('1c5b1bae6039bc44632d009b32338d4b59ab765c596d96577b52cc3dadc936e2')

build() {
  cd "${srcdir}/json_five-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/json_five-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
