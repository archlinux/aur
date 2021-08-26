# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-sqlalchemy2-stubs
_pkgname="${pkgname#python-}"
pkgver=0.0.2a13
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
b2sums=('978ba1fa6b9acf3ef62816a63e99b742261da0c302c504547c6137df8a961a59b55ddaaa26ce2a8fe6ae758ad5c8f3f81a2ede0111433060875d506d40e8dd51')

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
