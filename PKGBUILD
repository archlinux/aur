# Maintainer: Fabio Zanini <fabio.zanini _at_ fastmail.fm>
_pypiname=contextlib2
pkgname=python-contextlib2
pkgver=0.5.1
pkgrel=1
pkgdesc="contextlib2 is a backport of the standard library’s contextlib module to earlier Python versions"
arch=('any')
url="http://pypi.python.org/pypi/${_pypiname}"
license=('PSF')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/${_pypiname:0:1}/${_pypiname}/${_pypiname}-$pkgver.tar.gz")
md5sums=('b7f4c5a2b900c419b11b20f59838de1b')

build() {
  cd "${srcdir}/${_pypiname}-$pkgver"
  python setup.py build
}

package() {
  cd ${_pypiname}-$pkgver
  python setup.py install --root="${pkgdir}"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et:
