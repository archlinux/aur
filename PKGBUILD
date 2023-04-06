# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=sat-solver
pkgname=python-simplesat
pkgver=0.8.2
pkgrel=6
pkgdesc='SAT solver for use in Enstaller, based on the MiniSat implementation'
arch=('any')
url='https://github.com/enthought/sat-solver'
license=('MIT')
depends=('python' 'python-attrs' 'python-okonomiyaki' 'python-six')
makedepends=('git' 'python-setuptools')
source=("git+$url.git#tag=v$pkgver")
sha512sums=('SKIP')

build() {
  cd $_pkgname

  python setup.py build
}

package() {
  cd $_pkgname

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm 644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
