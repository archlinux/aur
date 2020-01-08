# Maintainer: Jose Riha <jose1711 gmail com>

pkgbase=python-mediafire-git
pkgname=('python-mediafire-git' 'python2-mediafire-git')
_module=mediafire
pkgver=r120.d5f1d7d
pkgrel=1
pkgdesc="Python MediaFire client library (git)"
url="https://github.com/MediaFire/mediafire-python-open-sdk"
license=('BSD')
arch=('any')
source=("mediafire"::"git://github.com/szlaci83/mediafire-python-open-sdk#branch=v1.5_api")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${_module}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build_python-mediafire-git() {
  makedepends=('python-setuptools' 'git')
  cd "${srcdir}/${_module}"
  python setup.py build
}

package_python-mediafire-git() {
  depends=('python' 'python-requests-toolbelt')
  conflicts=('python-mediafire')
  cd "${srcdir}/${_module}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

build_python2-mediafire-git() {
  makedepends=('python2-setuptools' 'git')
  cd "${srcdir}/${_module}"
  python2 setup.py build
}

package_python2-mediafire-git() {
  depends=('python2' 'python2-requests-toolbelt')
  conflicts=('python2-mediafire')
  cd "${srcdir}/${_module}"
  python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
