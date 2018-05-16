# Maintainer: Dan Beste <Dan.Ray.Beste@gmail.com>

pkgbase='python-pyzabbix'
pkgname=('python-pyzabbix' 'python2-pyzabbix')
pkgver=0.7.4
pkgrel=1
pkgdesc='Zabbix API Python interface'
arch=('any')
license=('LGPL2.1')
url='https://github.com/lukecyca/pyzabbix'
makedepends=(
  'python' 'python-setuptools' 'python-requests'
  'python2' 'python2-setuptools' 'python2-requests'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lukecyca/pyzabbix/archive/${pkgver}.tar.gz")
sha256sums=('bd1866d5b1ba40b225eb9c63b9ad99925db7fdff3fd4d8e6ec97c7da1be7e47c')

build_python-pyzabbix() {
  cd "${pkgname#python-}-${pkgver}"

  # Python 3:
  python setup.py build

  # Python 2:
  python2 setup.py build
}

package_python-pyzabbix() {
  depends=('python' 'python-requests')
  cd "${pkgname#python-}-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

package_python2-pyzabbix() {
  depends=('python2' 'python2-requests')
  cd "${pkgname#python2-}-${pkgver}"

  python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

# vim: ts=2 sw=2 et:
