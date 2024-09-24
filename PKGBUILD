# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-ibis
_pkgname=ibis_framework
pkgver=9.5.0
pkgrel=1
pkgdesc="A pandas-like deferred expression system, with first class SQL support"
arch=('any')
url="https://github.com/ibis-project/ibis"
license=('Apache-2.0')
depends=(python python-atpublic python-parsy python-pyarrow python-pyarrow-hotfix python-sqlglot python-toolz)
checkdepends=(python-pytest python-pytest-timeout)
optdepends=(
    python-duckdb
    python-fsspec
    python-pandas)
makedepends=(python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('1c8a29277e63ee0dfc289bc8f550164b5e3bdaec1b76b62436c37d331bb4ef84')

build(){
  cd "$_pkgname-$pkgver"
  python -m build -wn
}

package(){
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

#check(){
  #cd "$_pkgname-$pkgver"
  #PYTHONPATH=. pytest ibis/tests
#}
