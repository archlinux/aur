# Maintainer: cqzw555 < cqzw555@163.com >
# Contributor: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-rl
pkgver=3.1
pkgrel=4
pkgdesc="Alternative Python bindings for GNU Readline"
arch=('i686' 'x86_64' 'aarch64')
depends=('python' 'readline')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
url="https://github.com/stefanholek/rl"
license=('GPL' 'PSFL')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/r/${pkgname#python-}/${pkgname#python-}-$pkgver.tar.gz)
sha256sums=('508924bec14771088b24e80d9db97744235c43bbd96c95bb7557bd11b20388b2')

build() {
  cd "$srcdir/${pkgname#python-}-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${pkgname#python-}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
