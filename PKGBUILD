# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgbase=python-profig
pkgname=('python-profig' 'python2-profig')
_name=${pkgname#python-}
pkgver=0.5.1
pkgrel=1
pkgdesc="A threading library written in python. Help you build threaded app."
arch=('any')
url="https://github.com/dhagrow/profig"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('6c95e2dc9b1736db4d341c5a94906319c54db36c181bfcb7fe6d2c92b95e3aaa12e70763ee55b491e6aaeaa6c9967104debeb67976a39c0bcf2a227e17828b03')

prepare() {
  cp -a profig-$pkgver{,-py2}
}

package_python-profig() {
  depends=('python')
  cd profig-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-profig() {
  depends=('python2')
  cd profig-${pkgver}-py2
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
