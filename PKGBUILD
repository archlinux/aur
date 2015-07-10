# Maintainer: Chris Warrick <aur@chriswarrick.com>
pkgbase=python-pyrss2gen
pkgname=('python-pyrss2gen' 'python2-pyrss2gen')
_pyname=PyRSS2Gen
pkgver=1.1
pkgrel=1
pkgdesc='A Python library for generating RSS 2.0 feeds.'
arch=('any')
url="http://www.dalkescientific.com/Python/PyRSS2Gen.html"
license=('BSD')
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools')
options=(!emptydirs)
source=("http://www.dalkescientific.com/Python/${_pyname}-${pkgver}.tar.gz")
md5sums=("c56b9453d52b0a70be4f3e95112058aa")
conflicts=('pyrss2gen')
provides=('pyrss2gen')

prepare() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  cp -r "${srcdir}/${_pyname}-${pkgver}" "${srcdir}/${_pyname}-${pkgver}-py2"
}

package_python-pyrss2gen() {
  depends=('python' 'python-setuptools')
  cd "${srcdir}/${_pyname}-${pkgver}"
  python3 setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
}

package_python2-pyrss2gen() {
  depends=('python2' 'python2-setuptools')
  cd "${srcdir}/${_pyname}-${pkgver}-py2"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
