# Maintainer: Malte Jürgens <maltejur@dismail.de>

pkgname=cassowary
pkgver=0.5
pkgrel=1
pkgdesc="Run Windows Applications inside a VM on Linux as if they are native."
arch=("x86_64")
url="https://github.com/casualsnek/cassowary"
license=("GPL2")
depends=(python python-pip python-pyqt5 freerdp)
makedepends=(python-setuptools)
source=("$pkgname-$pkgver.tar.gz::https://github.com/casualsnek/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("6a837ec5819d44f48e23198afe5c0dda1d33bbdae3be60e9840aee02731f7bfc")

build() {
  cd $pkgname-$pkgver/app-linux
  python -c "from setuptools import setup; setup()" build
}

package() {
  cd $pkgname-$pkgver/app-linux
  python -c "from setuptools import setup; setup()" install --root="$pkgdir" --optimize=1
}
