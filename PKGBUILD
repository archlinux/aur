# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-sqlalchemy2-stubs
_pkgname="${pkgname#python-}"
pkgver=0.0.2a20
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
sha512sums=('238e823c6fb33d6fdb8d197d39994eff8660793b254f1e55e76cca5ac005dd2794c733e7fc5565234116c540cd5b95e7a2c35740657bba86465486bb483b78e7')
b2sums=('0aebdf28c10e544f81ed41516aeb261a152e95f35ce69679b5797832268e344decda89ceec1fb532429e8026c4918a3c7e6b55e3df754fd289271e11266c9c6c')

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
