# Maintainer: Gabriel Rauter <rauter.gabriel@gmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=pls
pkgver=3.2.0
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
sha512sums=('a1f0b6217a7cddb3e0bd029672dc72d0ec8f93a871ac2d8dba4c7fe306e7bfe71383187b6a4ff0ac49161bce60f108f97574ee35c941edd02c8424b6a1055d2a')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
