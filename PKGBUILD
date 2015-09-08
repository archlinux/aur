# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# From python-cement

set -u
_pybase='pathspec'
pkgbase="python-${_pybase}"
pkgname=(python{,2}-${_pybase})
pkgver='0.3.4'
pkgrel='1'
pkgdesc='Utility library for gitignore style pattern matching of file paths'
#url="https://pypi.python.org/pypi/${_pybase}/"
url='https://github.com/cpburnz/python-path-specification'
makedepends=(python{,2}{,-distribute})
license=('custom') #MPL 2.0
arch=('any')
_verwatch=("https://pypi.python.org/simple/${_pybase}/" "${_pybase}-\([0-9\.]\+\)\.tar\.gz" 't')
_srcdir="${_pybase}-${pkgver}"
source=("http://pypi.python.org/packages/source/${_pybase: 0:1}/${_pybase}/${_pybase}-${pkgver}.tar.gz")
sha256sums=('7605ca5c26f554766afe1d177164a2275a85bb803b76eba3428f422972f66728')

build() {
  set -u
  cd "${_srcdir}"
  python setup.py build
  set +u
}

check() {
  set -u
  cd "${_srcdir}"
  python setup.py test --verbose
  set +u
}

package_python-pathspec() {
  set -u
  depends=('python')
  cd "${_srcdir}"
  python setup.py install --root="${pkgdir}"
  #install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  set +u
}

package_python2-pathspec() {
  set -u
  depends=('python2')
  cd "${_srcdir}"
  python2 setup.py install --root="${pkgdir}"
  #install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  set +u
}
set +u
# vim:set ts=2 sw=2 et:
