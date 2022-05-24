# Maintainer: Gabriel Rauter <rauter.gabriel@gmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=pls
pkgver=5.0.0
pkgrel=1
pkgdesc='Prettier `ls` for the pros'
url='https://dhruvkb.github.io/pls'
arch=('any')
license=('GPL3')
depends=(
  'python-rich'
  'python-yaml'
)
optdepends=(
  'nerd-fonts: icon support'
)
makedepends=(
  'git'
  'python-poetry-core'
  'python-build'
  'python-installer'
)

source=("$pkgname-$pkgver.tar.gz::https://github.com/dhruvkb/pls/archive/$pkgver.tar.gz")
sha512sums=('6edabe98a89a1f03b5ac236c0ed8d3453c012fca19d6943c22c1cd0970cf617a11e8da9672bbac432a6050197af84961e845c9ff372c88383e8d7100b586e65c')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
