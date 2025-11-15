# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-types-docutils
_name=types_docutils
pkgver=0.22.3.20251115
pkgrel=1
pkgdesc="Typing stubs for docutils"
arch=('any')
url="https://github.com/python/typeshed"
license=('Apache-2.0')
depends=('python')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('0f79ea6a7bd4d12d56c9f824a0090ffae0ea4204203eb0006392906850913e16')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
