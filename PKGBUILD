# Maintainer: Chris Warrick <aur@chriswarrick.com>
pkgbase=python-typogrify
pkgname=('python-typogrify' 'python2-typogrify')
_pyname=typogrify
pkgver=2.0.7
pkgrel=1
pkgdesc='Filters to enhance web typography'
arch=('any')
url='https://github.com/mintchaos/typogrify'
license=('BSD')
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools'
             'python-smartypants' 'python2-smartypants')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('63f38f80531996f187d2894cc497ba08')

prepare() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  cp -r "${srcdir}/${_pyname}-${pkgver}" "${srcdir}/${_pyname}-${pkgver}-py2"
}

package_python-typogrify() {
  depends=('python' 'python-setuptools' 'python-smartypants')
  cd "${srcdir}/${_pyname}-${pkgver}"
  python3 setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
}

package_python2-typogrify() {
  depends=('python2' 'python2-setuptools' 'python-smartypants')
  cd "${srcdir}/${_pyname}-${pkgver}-py2"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
