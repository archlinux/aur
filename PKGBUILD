# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=('python-sqlalchemy-git' 'python2-sqlalchemy-git')
pkgver=origin.108.g1abc8e550
pkgrel=1
pkgdesc="Python SQL toolkit and Object Relational Mapper"
arch=('i686' 'x86_64')
url="http://www.sqlalchemy.org"
license=('custom:MIT')
depends=('python')
makedepends=('git' 'python-setuptools')
provides=("python-sqlalchemy=$pkgver")
conflicts=('python-sqlalchemy')
source=("git+https://bitbucket.org/zzzeek/sqlalchemy.git")
md5sums=('SKIP')

pkgver() {
  cd sqlalchemy
  git describe --tags | sed 's|[_-]|.|g' |sed s/origin./r/
}

package_python-sqlalchemy-git() {
  cd sqlalchemy
  python setup.py install --root="$pkgdir"
  install -D -m644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-sqlalchemy-git() {
  cd sqlalchemy
  python setup.py install --root="$pkgdir"
  install -D -m644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
