# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>
# Contributor: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=('python-aenum' 'python2-aenum')
_pkgname='aenum'
_srcdir='stoneleaf-aenum-1f140aa1b640'
pkgver=2.1.3
pkgrel=1
pkgdesc="Advanced Enumerations (compatible with Python's stdlib Enum), NamedTuples, and NamedConstants"
arch=('any')
url="https://bitbucket.org/stoneleaf/aenum"
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
source=(https://bitbucket.org/stoneleaf/${_pkgname}/get/${pkgver}.tar.bz2)
sha256sums=('c7b971a8cd93536334dc1a8adb028185b619f2068e8bb8ea9655cbc1cee89870')

build_python-aenum() {
  cd "${srcdir}/${_srcdir}"

  python3 setup.py build
}

package_python-aenum() {
  cd "${srcdir}/${_srcdir}"

  python3 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 aenum/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

build_python2-aenum() {
  cd "${srcdir}/${_srcdir}"

  python2 setup.py build
}

package_python2-aenum() {
  cd "${srcdir}/${_srcdir}"

  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 aenum/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
