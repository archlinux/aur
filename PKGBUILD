# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=('python-aenum' 'python2-aenum')
_pkgname='aenum'
_srcdir='stoneleaf-aenum-3d59c21500e4'
pkgver=2.0.6
pkgrel=1
pkgdesc="Advanced Enumerations (compatible with Python's stdlib Enum), NamedTuples, and NamedConstants"
arch=('any')
url="https://bitbucket.org/stoneleaf/aenum"
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
source=(https://bitbucket.org/stoneleaf/${_pkgname}/get/${pkgver}.tar.bz2)
sha512sums=('c4c08b062ad171c5d15583868fcab0d6cfa2f5589b4077c99bdae8d86d1da27cf2263b54e3afc624841c042465914363fcc076883dd9f23eb4b81f8b4ea226ae')

package_python-aenum() {
  depends=('python-setuptools')

  cd "${srcdir}/${_srcdir}"

  python3 setup.py build
  python3 setup.py install --root="${pkgdir}" -O1

  install -Dm644 aenum/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-aenum() {
  depends=('python2-setuptools')

  cd "${srcdir}/${_srcdir}"

  python2 setup.py build
  python2 setup.py install --root="${pkgdir}" -O1

  install -Dm644 aenum/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
