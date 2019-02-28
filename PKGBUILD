# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgbase=python-pythreadworker
pkgname=('python-pythreadworker' 'python2-pythreadworker')
_name=${pkgname#python-}
pkgver=0.9.0
pkgrel=1
pkgdesc="A threading library written in python. Help you build threaded app."
arch=('any')
url="https://github.com/eight04/pyWorker"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('507674fb96d52480106c514f100501aafe2ba2b42f8a04bd27e05687700be84d')

prepare() {
  cp -a pythreadworker-$pkgver{,-py2}
}

build() {
  cd "${srcdir}"/pythreadworker-${pkgver}
  python setup.py build

  cd "${srcdir}"/pythreadworker-${pkgver}-py2
  python2 setup.py build
}

package_python-pythreadworker() {
  cd pythreadworker-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-pythreadworker() {
  cd pythreadworker-${pkgver}-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
}
