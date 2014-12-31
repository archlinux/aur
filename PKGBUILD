# Maintainer: Chris Warrick <aur@chriswarrick.com>
pkgname=python-bbcode-git
_pyname=bbcode
_gitname=bbcode
pkgver=20150101
pkgrel=1
pkgdesc='A pure python bbcode parser and formatter.  (git version)'
arch=('any')
url='http://pypi.python.org/pypi/bbcode'
license=('BSD')
depends=('python')
makedepends=('git')
options=(!emptydirs)
provides=('python-bbcode')
conflicts=('python-bbcode')
source=("git://github.com/dcwatson/${_gitname}.git")
md5sums=('SKIP')

package() {
  cd "${srcdir}/${_gitname}"
  python3 setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

pkgver() {
  # upstream has no tags, falling back to dates
  date '+%Y%m%d'
}

# vim:set ts=2 sw=2 et:
