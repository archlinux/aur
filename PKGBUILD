# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname="python-marshmallow-union"
_pkgname="${pkgname#python-}"
pkgver=0.1.15.post1
pkgrel=1
pkgdesc='Union fields for marshmallow'
arch=('any')
url='https://github.com/adamboche/python-marshmallow-union'
license=('MIT')
depends=('python' 'python-marshmallow')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha512sums=('1faa41715c988bbb92e254bec6530636d741fa5755f0dea9634f39335346e02d1e2ee7a65c644e1ebed8c9a98386bcc9242564529bed0c9cd27fb41643e255a9')

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
