# Maintainer: gilcu3
# Previous Maintainer: sameer
# Contributor: demize

pkgname=python-mypy-protobuf
pkgver=5.1.0
pkgrel=1

pkgdesc='Generate mypy stub files from protobuf specs'
url='https://github.com/nipunn1313/mypy-protobuf'
arch=('any')
license=('Apache-2.0')

depends=('mypy' 'protobuf' 'python' 'python-protobuf')
optdepends=('python-types-protobuf: type stubs for checking generated code with mypy')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')

source=("https://files.pythonhosted.org/packages/source/m/mypy-protobuf/mypy_protobuf-$pkgver.tar.gz")

sha256sums=('8493758852a9cdc075a11dbe96c6e37ea2feba5fd5f33ef7442b9a275322a94c')

build() {
  cd mypy_protobuf-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd mypy_protobuf-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
