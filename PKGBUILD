# Maintainer: Chris Warrick <aur@chriswarrick.com>
pkgbase=python-kwpbar
pkgname=('python-kwpbar' 'python2-kwpbar')
_pyname=kwpbar
pkgver=0.1.0
pkgrel=1
pkgdesc='A progress bar for Python.'
arch=('any')
url='https://github.com/Kwpolska/kwpbar.py'
license=('???')
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('bb80f3eb8cf1442c46fcf28298173848')

prepare() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  cp -r "${srcdir}/${_pyname}-${pkgver}" "${srcdir}/${_pyname}-${pkgver}-py2"
}

package_python-kwpbar() {
  depends=('python' 'python-setuptools')
  cd "${srcdir}/${_pyname}-${pkgver}"
  python3 setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
}

package_python2-kwpbar() {
  depends=('python2' 'python2-setuptools')
  cd "${srcdir}/${_pyname}-${pkgver}-py2"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
