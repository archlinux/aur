# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-psycopg-pool
_pkgname=psycopg-pool
pkgver=3.1.1
pkgrel=1
pkgdesc="Connection pool for Psycopg"
arch=('any')
url="https://www.psycopg.org/psycopg3/"
license=('LGPL-3')
depends=('python')
optdepends=()
makedepends=('python-setuptools')
checkdepends=()
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('bc579078dc8209f1ce280228460f96770756f24babb5d8ab2418800e9082a973')

build(){
  cd "$_pkgname-$pkgver"
  python setup.py build
}

package(){
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
