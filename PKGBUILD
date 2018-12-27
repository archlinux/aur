# Maintainer: Andrew Chen <xor.tux@gmail.com>

pkgbase=python-cstruct
pkgname=('python-cstruct' 'python2-cstruct')
pkgver=1.8
pkgrel=1
pkgdesc="C-style structs for Python"
url="https://github.com/andreax79/python-cstruct"
arch=('any')
license=('MIT')
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools')
source=("https://pypi.python.org/packages/source/c/cstruct/cstruct-$pkgver.tar.gz")
sha256sums=('e11684fd5e8b9a44834f96dc88293cd7cf5cb393bddee4a9f83ef3f9824bb7af')

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
