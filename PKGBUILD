# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgbase=python-profig
pkgname=('python-profig' 'python2-profig')
_name=${pkgname#python-}
pkgver=0.4.1
pkgrel=1
pkgdesc="A threading library written in python. Help you build threaded app."
arch=('any')
url="https://bitbucket.org/dhagrow/profig/"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('197459c3ea89f3064e856bc3c7182854c8b83240307383fd9147561bd5ab7c0560371c25f7403cd060118b81e56b48012ab8213651a5c30d801541e8e53813f8')

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
