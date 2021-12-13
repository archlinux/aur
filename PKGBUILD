# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgbase=python-pythreadworker
pkgname=('python-pythreadworker' 'python2-pythreadworker')
_name=${pkgname#python-}
pkgver=0.9.0
pkgrel=3
pkgdesc="A threading library written in python. Help you build threaded app."
arch=('any')
url="https://github.com/eight04/pyWorker"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('ba1eaa1d7d3eae32d309a0382628f9a2c67f3889d2aa61e867d0a6caf3c8cc1aaa10a7bd7a9aa16d608024d3fe6245d4c2be3854e9ffb24a27b73e760e6a84b7')

prepare() {
  cp -a pythreadworker-$pkgver{,-py2}
}

package_python-pythreadworker() {
  depends=('python')
  cd pythreadworker-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-pythreadworker() {
  depends=('python2')
  cd pythreadworker-${pkgver}-py2
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
