# Maintainer: Marty Plummer (netz) <ntzrmtthihu777 (at) gmail (dot) com
pkgbase=('python-pyinputevent')
pkgname=('python-pyinputevent-git'
         'python2-pyinputevent-git')
pkgver=0.1b0.d2075fa
pkgrel=2
pkgdesc="Provides a python interface to Linux's input subsystem"
url="https://github.com/ntzrmtthihu777/pyinputevent"
arch=('any')
license=('MIT')
source=('git://github.com/ntzrmtthihu777/pyinputevent.git')
md5sums=('SKIP')

package_python2-pyinputevent-git() {
  depends=("python2")
  cd "${srcdir}/pyinputevent"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

package_python-pyinputevent-git() {
  depends=("python")
  cd "${srcdir}/pyinputevent"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

pkgver() {
  cd "${srcdir}/pyinputevent"
  printf "%s.%s" "$(python setup.py --version)" \
    "$(git rev-parse --short master)"
}

