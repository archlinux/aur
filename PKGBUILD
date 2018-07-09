# Maintainer: Ilya Elenskiy <elenskiy.ilya[@]gmail[.]com>

pkgname=python-rx
_name=rx
pkgver=1.6.1
pkgrel=1
pkgdesc="The Reactive Extensions for Python (RxPY)"
arch=('any')
url='http://reactivex.io'
license=('apache')
makedepends=( 'python-setuptools' )
source=("rx::git+https://github.com/ReactiveX/RxPY.git#tag=${pkgver}")
md5sums=('SKIP')


build() {
  cd "${srcdir}/${_name}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
