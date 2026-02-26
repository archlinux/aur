# Maintainer: gesh <gesh@gesh.uni.cx>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-types-docutils
_name=types_docutils
pkgver=0.22.3.20260223
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
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('e90e868da82df615ea2217cf36dff31f09660daa15fc0f956af53f89c1364501')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
