# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-flake8-debugger
pkgver=4.0.0
pkgrel=2
pkgdesc='ipdb/pdb statement checker plugin for flake8'
arch=('any')
license=('MIT')
url='https://github.com/JBKahn/flake8-debugger'
depends=('flake8')
makedepends=('python-poetry' 'python-setuptools' 'python-pytest-runner')
source=(https://pypi.python.org/packages/source/f/flake8-debugger/flake8-debugger-$pkgver.tar.gz)
sha512sums=('b2f234a294c010561298efac548d4ed327dccb34cd765993b31966cbd2609c4a1976559fd6698031365b83c98f9a03b4693b334cef402ddda2a9e13354371aa3')

build() {
  cd flake8-debugger-$pkgver
  python setup.py build
}

check() {
  cd flake8-debugger-$pkgver
  python setup.py test
}

package() {
  cd flake8-debugger-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
