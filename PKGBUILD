# Maintainer: Anthony25 <Anthony Ruhier>

pkgbase=python-tree-format-git
_name="tree-format"
pkgname=(python-tree-format-git python2-tree-format-git)
pkgver=r25.c8c4544
pkgrel=2
pkgdesc='Python library for printing trees on the console.'
arch=(any)
_url='github.com/jml/tree-format'
url="https://${_url}"
license=(BSD)
makedepends=(
  python-setuptools
  python2-setuptools
)
conflicts=("python-${_name}" "python2-${_name}")
replaces=("python-${_name}" "python2-${_name}")
options=(!emptydirs)
source=("${_name}::git://${_url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir"/${_name}
  printf "r%s.%s" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_python-tree-format-git() {
  cd "${srcdir}/${_name}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

package_python2-tree-format-git() {
  cd "${srcdir}/${_name}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
