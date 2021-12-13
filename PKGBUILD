# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-sqlalchemy2-stubs
_pkgname="${pkgname#python-}"
pkgver=0.0.2a19
pkgrel=2
pkgdesc="PEP-484 typing stubs for SQLAlchemy 1.4 and SQLAlchemy 2.0"
arch=('any')
url="https://github.com/sqlalchemy/sqlalchemy2-stubs"
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-pip' 'python-typing_extensions')
provides=('python-sqlalchemy-stubs')
conflicts=('python-sqlalchemy-stubs')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('787b22be93c0a8859ac328b5284874df800cb56d3ffc36b5a45c997b476fa7058963f24978295f018e1c9284da38dc07c74df8768cabc1467e9a15de03737890')
b2sums=('1b2285de275d09e694ef709587c40289d02ea1b8bfdb290cc34ceaafee002221dd7830299882a8847d51cfd9bf1003c6c5050e79b68766ecbc63a85740fae913')

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
