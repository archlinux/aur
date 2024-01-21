# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-types-docutils
_name=${pkgname#python-}
pkgver=0.20.0.20240106
pkgrel=1
pkgdesc="Typing stubs for docutils"
arch=('any')
url="https://github.com/python/typeshed"
license=('Apache-2.0')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('03992ec976fbe080db588e1e56a83c5e4aba5c733022b25bb26cb84397b96049')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
