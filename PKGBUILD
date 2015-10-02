# Maintainer: Chris Warrick <aur@chriswarrick.com>
pkgbase=python-bbcode
pkgname=('python-bbcode' 'python2-bbcode')
_pyname=bbcode
pkgver=1.0.21
pkgrel=2
pkgdesc='A pure python bbcode parser and formatter.'
arch=('any')
url='https://pypi.python.org/pypi/bbcode'
license=('BSD')
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        "LICENSE")
md5sums=('ed5725fe323f8acd9197e71717e6ebef'
         'f013c3769d2db3f0f790d19978c5031d')

prepare() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  cp -r "${srcdir}/${_pyname}-${pkgver}" "${srcdir}/${_pyname}-${pkgver}-py2"
}

package_python-bbcode() {
  depends=('python' 'python-setuptools')
  cd "${srcdir}/${_pyname}-${pkgver}"
  python3 setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
}

package_python2-bbcode() {
  depends=('python2' 'python2-setuptools')
  cd "${srcdir}/${_pyname}-${pkgver}-py2"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
