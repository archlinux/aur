# Maintainer: Chris Warrick <aur@chriswarrick.com>
pkgbase=python-micawber
pkgname=('python-micawber' 'python2-micawber')
_pyname=micawber
pkgver=0.3.5
pkgrel=1
pkgdesc='A small library for extracting rich content from URLs.'
arch=('any')
url='https://github.com/coleifer/micawber'
license=('MIT')
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools')
options=(!emptydirs)
source=("https://pypi.io/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('373b44462fd5b2aa209a65c93dfaa212')

prepare() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  cp -r "${srcdir}/${_pyname}-${pkgver}" "${srcdir}/${_pyname}-${pkgver}-py2"
}

package_python-micawber() {
  depends=('python' 'python-setuptools')
  cd "${srcdir}/${_pyname}-${pkgver}"
  python3 setup.py install --root="${pkgdir}/" --optimize=1
}

package_python2-micawber() {
  depends=('python2' 'python2-setuptools')
  cd "${srcdir}/${_pyname}-${pkgver}-py2"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
