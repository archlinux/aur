# Maintainer: Ondřej Hošek <ondra dot hosek at gmail dot com>

pkgname=python-types-psycopg2
_name=${pkgname#python-}
pkgver=2.9.21.20240417
pkgrel=1
pkgdesc="Typing stubs for psycopg2"
arch=('any')
url="https://pypi.org/project/types-psycopg2/"
license=('Apache-2.0')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('05db256f4a459fb21a426b8e7fca0656c3539105ff0208eaf6bdaf406a387087')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
