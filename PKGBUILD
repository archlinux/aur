# Maintainer: Jose Lopes <josemslopes at gmail dot com>
# Contributor: Morten Linderud <foxboron@archlinux.org>

pkgname=python-sqlobject
pkgver=3.11.0
pkgrel=3
pkgdesc="SQLObject, an object-relational mapper for Python"
url="http://sqlobject.org/"
arch=('any')
license=('LGPL')
depends=('python-pydispatcher' 'python-formencode')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sqlobject/sqlobject/archive/${pkgver}.tar.gz")
sha256sums=('2c74bb1a031f63d85bf1177746803982a8f62e4c5dd06961423a02391c593a7a')

build(){
  cd "sqlobject-$pkgver"
  python setup.py build
}

package_python-sqlobject() {
  cd "sqlobject-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
