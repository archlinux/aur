# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgbase=python-profig
pkgname=('python-profig' 'python2-profig')
_name=${pkgname#python-}
pkgver=0.5.0
pkgrel=1
pkgdesc="A threading library written in python. Help you build threaded app."
arch=('any')
url="https://bitbucket.org/dhagrow/profig/"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('ec26e323ad69d55010104967a291ad2d0cf335e50c06d2876690ed661fd6b134d3d0935598e57d802ae2318c5ebdf747522adb90f9c7aba92a3fa019ddb03ca7')

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
