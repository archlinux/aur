# Maintainer: Gabriel Rauter <rauter.gabriel@gmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=pls
pkgver=4.0.2
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
sha512sums=('30b61a7d83183b41f2c2bdebba65e24faa26ef624dce3f90cc4843c73b6a8cb9bfd6a2399cfc5a6b02f4060441b285e795cb4e8c306c1c07756c533c08427b1c')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
