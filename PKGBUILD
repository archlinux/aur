# Maintainer: Luis Falcon <falcon at gnuhealth dot org>

pkgname=tinydb
_pkgname=tinydb
_name=tinydb
pkgver=4.5.0
pkgrel=1
pkgdesc="TinyDB is a tiny, document oriented database optimized for your happiness"
arch=('any')
url="https://github.com/msiemens/tinydb"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('SKIP')

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
