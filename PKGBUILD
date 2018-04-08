# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=python-prospector
pkgver=0.12.7
pkgrel=1
pkgdesc="Python static analysis tool"
arch=('any')
makedepends=('python-setuptools'
             'pydocstyle'
             'python-pep8-naming'
             'python-mccabe'
             'python-pycodestyle'
             'python-pyflakes'
             'python-yaml'
             'python-dodgy'
             'python-setoptconf'
             'python-requirements-detector'
             'python-pylint-common'
             'python-pylint-plugin-utils'
             'python-pylint-django'
             'python-pylint-celery'
             'python-pylint-flask')
optdeps=('python-pyroma: check setup.py'
         'python-vulture: find dead code')
url="https://github.com/landscapeio/prospector"
license=('GPL2')
source=(https://github.com/landscapeio/prospector/archive/${pkgver}.tar.gz)
md5sums=('45d00e6b6b70b69d3f02c64c74f9f40c')

build() {
  cd "$srcdir/${pkgname#python-}-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname#python-}-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"/LICENSE
}
# vim:set ts=2 sw=2 et:
