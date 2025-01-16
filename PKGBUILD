# Maintainer: Grégoire Payen de La Garanderie <arch at hochet.info>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>

pkgname=pwman3
pkgver=0.13.1
pkgrel=1
pkgdesc="A console based password management application written in Python"
arch=('any')
url="https://github.com/pwman3/pwman3"
license=('GPL')
depends=('python-colorama' 'xsel' 'python-cryptography')
optdepends=('python-psycopg2: PostgreSQL support', 'python-pymysql: MySQL support', 'python-pymongo: MongoDB support')
makedepends=(python-build python-installer python-wheel python-setuptools-scm)
source=(https://files.pythonhosted.org/packages/source/p/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('c35ed11e845fd575b7fdbe6e3ac1a7483fd46c8d24b8a076730465f812da9462')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}

