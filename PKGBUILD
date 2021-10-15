# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-sqlalchemy2-stubs
_pkgname="${pkgname#python-}"
pkgver=0.0.2a18
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
sha512sums=('2298d2886d2c6fdd55c48156cd006a289852685d72d511198b8c6df9517c82fbdc8180494f2c954b8038dfcf050798cede361c16c5be8b76c61ea39c6e526aaa')
b2sums=('3a6bb493ee9a6cfa7b0445123c2c622dd026cf87c0d1b94c1c4ccf06840c3fc5a0c188983e4bacf2222aa040e59722590cda6ca30cc35ec93f54b8b000a8057c')

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
