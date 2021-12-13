# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgbase=python-cashier
pkgname=('python-cashier' 'python2-cashier')
_name=${pkgname#python-}
pkgver=1.3
pkgrel=3
pkgdesc='Persistent caching for python functions.'
arch=('any')
url='https://pypi.org/project/cashier/'
license=('MIT')
makedepends=(
  'python-setuptools'
  'python2-setuptools'
)

source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.zip")
sha512sums=('3e1033455df18651a034e0fbe98255fc2af0a44684e026d5f97e0141bc051f0a2e41368677d4675e19f46ae14130cea94b1f963227592cdbd3b6a044b74a6136')

prepare() {
  cp -a cashier-$pkgver{,-py2}
}

package_python-cashier() {
  cd cashier-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-cashier() {
  cd cashier-${pkgver}-py2
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
