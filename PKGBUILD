# Maintainer: Chris Warrick <aur@chriswarrick.com>
pkgbase=python-datecond
pkgname=('python-datecond' 'python2-datecond')
_pyname=datecond
pkgver=0.1.7
pkgrel=1
pkgdesc='Parser for date range conditionals.'
arch=('any')
url='https://github.com/Kwpolska/datecond'
license=('BSD')
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools'
             'python-dateutil' 'python2-dateutil')
options=(!emptydirs)
source=("https://pypi.io/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('2da115c3753e045e69aa4f5de94cbe29')

prepare() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  cp -r "${srcdir}/${_pyname}-${pkgver}" "${srcdir}/${_pyname}-${pkgver}-py2"
}

package_python-datecond() {
  depends=('python' 'python-setuptools' 'python-dateutil')
  cd "${srcdir}/${_pyname}-${pkgver}"
  python3 setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
}

package_python2-datecond() {
  depends=('python2' 'python2-setuptools' 'python2-dateutil')
  cd "${srcdir}/${_pyname}-${pkgver}-py2"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
