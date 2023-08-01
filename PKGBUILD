# Maintainer: Gabriel Rauter <rauter.gabriel@gmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=pls
pkgver=6.0.0
pkgrel=1
pkgdesc='Prettier `ls` for the pros'
url='https://dhruvkb.github.io/pls'
arch=('any')
license=('GPL3')
depends=(
  'python-rich'
  'python-yaml'
  'python-requests'
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
sha512sums=('a4383b9521fa68578be27e15d8645ee48dd350de5d7791aaa0daa4e0d09549c6b1fbba9efb0f741fb0fcdf89ff36437e25be8cc09a3e084001ea875e266e48cd')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
