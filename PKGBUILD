# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=python-prospector
pkgver=1.1.1
pkgrel=1
pkgdesc="Python static analysis tool"
arch=('any')
makedepends=('python-setuptools'
             'python-pydocstyle'
             'python-pep8-naming'
             'python-mccabe'
             'python-pycodestyle'
             'python-pyflakes'
             'python-yaml'
             'python-dodgy'
             'python-setoptconf'
             'python-requirements-detector'
             'python-pylint-common'
             'python-pylint-plugin-utils')
optdeps=('python-pyroma: check setup.py'
         'python-vulture: find dead code'
         'python-mypy: optional type checking')
url="https://github.com/PyCQA/prospector"
license=('GPL2')
source=(${url}/archive/${pkgver}.tar.gz)
md5sums=('33b1ef12a82fb1cc6d07cc6a478795d4')

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
