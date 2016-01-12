# Maintainer: Cedric Girard <girard.cedric@gmail.com>
_pythonmod=contextlib2
pkgname=python2-contextlib2
pkgver=0.5.0
pkgrel=1
pkgdesc="contextlib2 is a backport of the standard library’s contextlib module to earlier Python versions"
arch=('any')
url="http://pypi.python.org/pypi/${_pythonmod}"
license=('PSF')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/source/${_pythonmod:0:1}/${_pythonmod}/${_pythonmod}-$pkgver.tar.gz")
md5sums=('713f492563e61898ecbe76b28b0edc80')

build() {
  cd ${srcdir}/${_pythonmod}-$pkgver
  python2 setup.py build
  }

package() {
  cd ${srcdir}/${_pythonmod}-$pkgver
  python2 setup.py install --root=${pkgdir}
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
