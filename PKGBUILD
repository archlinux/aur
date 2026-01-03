# Maintainer: Jose Lopes <josemslopes at gmail dot com>
# Contributor: Morten Linderud <foxboron@archlinux.org>

pkgname=python-sqlobject
pkgver=3.13.1
pkgrel=1
pkgdesc="SQLObject, an object-relational mapper for Python"
url="http://sqlobject.org/"
arch=('any')
license=('LGPL')
depends=(
  'python-pydispatcher'
  'python-formencode'
)
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sqlobject/sqlobject/archive/${pkgver}.tar.gz")
sha512sums=('aad1f6efdeb8eca6d2c936321ab8434b3e5428a2ea94d2361f71d7c87cdc098c3749f3688ee89930106920fde02829c96086d0891f9f027048d9eae9623db70e')

build(){
  cd "sqlobject-$pkgver"
  python setup.py build
}

package_python-sqlobject() {
  cd "sqlobject-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
