# Maintainer: Malte Jürgens <maltejur@dismail.de>

pkgname=cassowary
pkgver=0.4
pkgrel=1
pkgdesc="Run Windows Applications inside a VM on Linux as if they are native."
arch=("x86_64")
url="https://github.com/casualsnek/cassowary"
license=("GPL2")
depends=(python python-pip python-pyqt5 freerdp)
makedepends=(python-setuptools)
source=("$pkgname-$pkgver.tar.gz::https://github.com/casualsnek/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("8f58432ee37e2f479991168a5ae898e4c9950b3b8f6f0449e21115525fa5c7c9")

build() {
  cd $pkgname-$pkgver/app-linux
  python -c "from setuptools import setup; setup()" build
}

package() {
  cd $pkgname-$pkgver/app-linux
  python -c "from setuptools import setup; setup()" install --root="$pkgdir" --optimize=1
}
