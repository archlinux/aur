# Maintainer: Pablo Palazon <ppalazon@phyxor.com>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=sat-solver
pkgname=python-simplesat
pkgver=0.9.2
pkgrel=1
pkgdesc='SAT solver for use in Enstaller, based on the MiniSat implementation'
arch=('any')
url='https://github.com/enthought/sat-solver'
license=('BSD-3-Clause')
depends=('python' 'python-attrs' 'python-okonomiyaki' 'python-six')
makedepends=('git' 'python-setuptools')
_tag=fa938f3de5da124d4f662211c4bf21699eb4c5a2 # git rev-parse v$tagver
source=("git+${url}.git#tag=${_tag}")
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
