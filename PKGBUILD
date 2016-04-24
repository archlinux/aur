# Maintainer: Andrew Chen <andrew.chuanye.chen@gmail.com>

pkgbase=python-cstruct
pkgname=('python-cstruct' 'python2-cstruct')
pkgver=1.0
pkgrel=1
pkgdesc="C-style structs for Python"
url="https://github.com/andreax79/python-cstruct"
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools')
source=('https://pypi.python.org/packages/source/c/cstruct/cstruct-1.0.tar.gz')
md5sums=('b12c1f3718875cafd52bc9222bd21dd5')

prepare() {
  cp -r cstruct-${pkgver} python2-cstruct-${pkgver}
}

build() {
  cd ${srcdir}/cstruct-${pkgver}
  python setup.py build

  cd ${srcdir}/python2-cstruct-${pkgver}
  python2 setup.py build
}

package_python-cstruct() {
  depends=('python')

  cd cstruct-${pkgver}
  python setup.py install -O1 --root="${pkgdir}"
}

package_python2-cstruct() {
  depends=('python2')

  cd python2-cstruct-${pkgver}
  python2 setup.py install -O1 --root="${pkgdir}"
}
