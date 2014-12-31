# Maintainer: Chris Warrick <aur@chriswarrick.com>
pkgname=python-bbcode
_pyname=bbcode
pkgver=1.0.20
pkgrel=1
pkgdesc='A pure python bbcode parser and formatter.'
arch=('any')
url='http://pypi.python.org/pypi/bbcode'
license=('BSD')
depends=('python')
options=(!emptydirs)
source=("http://pypi.python.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        "LICENSE")
md5sums=('bb6e1147919d2e8f5f2f57d751d6a36c'
         'f013c3769d2db3f0f790d19978c5031d')

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python3 setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
