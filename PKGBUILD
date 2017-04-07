# Maintainer: Anthony25 <Anthony Ruhier>

pkgbase=python-pytest-flask
_pkgbase="${pkgbase#python-}"
pkgname=(python-pytest-flask python2-pytest-flask)
pkgver=0.10.0
pkgrel=1
pkgdesc="A set of pytest fixtures to test Flask applications."
arch=(any)
url='https://github.com/pytest-dev/pytest-flask'
license=(MIT)
makedepends=(
  "python-pytest"
  python-setuptools
  "python2-pytest"
  python2-setuptools
)
options=(!emptydirs)
source=("https://github.com/pytest-dev/${_pkgbase}/archive/${pkgver}.tar.gz")
sha256sums=('46751b8224189a77e47cf584acc577f9cf35fb6aa68ebc427a15590a8de5b08b')

package_python-pytest-flask() {
  depends=('python-flask' 'python-werkzeug')
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

package_python2-pytest-flask() {
  depends=('python2-flask' 'python2-werkzeug')
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
