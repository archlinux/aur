pkgbase=python-pyclipper
_pkgname=pyclipper
pkgname=("python-${_pkgname}" "python2-${_pkgname}")
pkgver=1.1.0.post3
pkgrel=2
pkgdesc="Cython wrapper for the C++ translation of the Angus Johnson's Clipper library"
url="https://github.com/fonttools/pyclipper"
arch=(i686 x86_64)
license=('MIT')
makedepends=('python-setuptools-scm' 'python2-setuptools-scm' 'cython' 'cython2')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.zip")
sha256sums=('f1acd74bdb8c114fea2eab0bcf76460d1ef4b4120953e410fc7c638eb79e9e98')

package_python-pyclipper() {
  depends=('python')

  cd "${srcdir}/${_pkgname}-$pkgver"
  python setup.py install --root=${pkgdir} --optimize=1
}

package_python2-pyclipper() {
  depends=('python2')

  cd "${srcdir}/${_pkgname}-$pkgver"
  python2 setup.py install --root=${pkgdir} --optimize=1
}
