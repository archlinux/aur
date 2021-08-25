# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-sqlalchemy2-stubs
_pkgname="${pkgname#python-}"
pkgver=0.0.2a12
pkgrel=1
pkgdesc="PEP-484 typing stubs for SQLAlchemy 1.4 and SQLAlchemy 2.0"
arch=('any')
url="https://github.com/sqlalchemy/sqlalchemy2-stubs"
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-pip' 'python-typing_extensions')
provides=('python-sqlalchemy-stubs')
conflicts=('python-sqlalchemy-stubs')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('7926b6e13785d6fcd829595343906340ac839cd12ee486d99e91ce6060edb57966020fbdfc019001aa201d0d8e168126e165ac11a3aae8a57da132343bab44f1')

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
