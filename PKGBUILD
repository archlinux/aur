# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgbase=python-profig
pkgname=('python-profig' 'python2-profig')
_name=${pkgname#python-}
pkgver=0.4.1
pkgrel=1
pkgdesc="A threading library written in python. Help you build threaded app."
arch=('any')
url="https://github.com/eight04/pyWorker"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('74aadcf6252fd0ed9757a1383e24963e1660817f90ffc962c8293349fa6f16b7')

prepare() {
  cp -a profig-$pkgver{,-py2}
}

build() {
  cd "${srcdir}"/profig-${pkgver}
  python setup.py build

  cd "${srcdir}"/profig-${pkgver}-py2
  python2 setup.py build
}

package_python-profig() {
  cd profig-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-profig() {
  cd profig-${pkgver}-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
}
