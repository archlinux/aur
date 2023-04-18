# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=python-clickclick
pkgver=20.10.2
pkgrel=5
pkgdesc='Click command line utilities'
url='https://codeberg.org/hjacobs/python-clickclick'
license=('Apache')
arch=('any')
depends=('python-click' 'python-yaml')
makedepends=('python-setuptools' 'flake8')
#checkdepends=('python-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('d8954d231bff6945ac0e8350be05775a8a0b852dd0284e3446b3f9c8bc5861870ed1bc058e132c144fe8d543aee87d7a7a54894abdb4006664e5994c8cfb507f')

build() {
  cd $pkgname

  python setup.py build
}

#check() {
#  cd $pkgname
#
#  python setup.py test
#}

package() {
  cd $pkgname

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
