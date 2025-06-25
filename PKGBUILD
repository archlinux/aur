# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
_name=cgen
pkgname=python-$_name
pkgver=2025.1
pkgrel=1
pkgdesc="A C/C++ source generation from an AST"
arch=('any')
url="https://github.com/inducer/cgen"
license=('MIT')
depends=('python-pytools')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=($_name-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha256sums=('c456dba68c4b69e28ec0f6bf88a746b09fd2d7fc4f29c5479a256800dfe4fb33')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  python -m pytest
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
