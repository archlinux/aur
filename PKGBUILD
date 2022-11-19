# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-packaging
pkgver=21.3
pkgrel=1
pkgdesc="Core utilities for Python packages"
arch=('any')
url="https://github.com/pypa/packaging"
license=('Apache')
depends=('python38-pyparsing')
makedepends=('python38-setuptools')
checkdepends=('python38-pytest' 'python38-pretend')
source=("https://github.com/pypa/packaging/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('8960deacda26877b73d98a3b632e760e902a16ec7a04707f84044980e4d4fb33e4f584db115c9008066aa876079f28633bafe37fbd5ce9a23830b6b89eb4ae7a')

build() {
  cd packaging-$pkgver
  python3.8 setup.py build
}

check() {
  cd packaging-$pkgver
  python3.8 -m pytest
}

package() {
  cd packaging-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
}
