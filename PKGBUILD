# Maintainer: Score_Under <seejay.11@gmail.com>
# Based on work by: Felix Yan <felixonmars@archlinux.org>

pkgname=python-packaging-21
pkgver=21.3
pkgrel=1
pkgdesc="Core utilities for Python packages (version 21 for LooseVersion)"
arch=('any')
url="https://github.com/pypa/packaging"
license=('Apache')
depends=('python-pyparsing')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pretend')
provides=("python-packaging=$pkgver")
conflicts=('python-packaging')
source=("https://github.com/pypa/packaging/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('8960deacda26877b73d98a3b632e760e902a16ec7a04707f84044980e4d4fb33e4f584db115c9008066aa876079f28633bafe37fbd5ce9a23830b6b89eb4ae7a')

build() {
  cd packaging-$pkgver
  python setup.py build
}

check() {
  cd packaging-$pkgver
  python -m pytest
}

package() {
  cd packaging-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
