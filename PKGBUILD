# Contributor: Michal Wojdyla < micwoj9292 at gmail dot com >
# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-rl
pkgver=3.0
pkgrel=1
pkgdesc="Alternative Python bindings for GNU Readline"
arch=('i686' 'x86_64')
depends=('python' 'readline')
makedepends=('python-setuptools')
url="https://github.com/stefanholek/rl"
license=('GPL' 'PSFL')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/r/${pkgname#python-}/${pkgname#python-}-$pkgver.zip)
sha256sums=('0ac8dc082385109968af9e702c0906faf452743e7400749e1c50668ceeea287a')

build() {
  cd "$srcdir/${pkgname#python-}-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname#python-}-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}