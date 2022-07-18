# Maintainer: Gabriel Rauter <rauter.gabriel@gmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=pls
pkgver=5.3.0
pkgrel=2
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
sha512sums=('7bcb54e7d49568ae763306e2aa1622c3295f5e46e71b2513bfcb6ed99132ebba1ac2991e35b7fa6d4fadf6dd2277ebab54fe576c25201555fc6c695e26b17e55')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
