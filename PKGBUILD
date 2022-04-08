# Maintainer: Malte Jürgens <maltejur@dismail.de>

pkgname=cassowary
pkgver=0.6
pkgrel=1
pkgdesc="Run Windows Applications inside a VM on Linux as if they are native."
arch=("x86_64")
url="https://github.com/casualsnek/cassowary"
license=("GPL2")
depends=(python python-pip python-pyqt5 freerdp libvirt-python)
makedepends=(python-setuptools)
source=("$pkgname-$pkgver.tar.gz::https://github.com/casualsnek/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=("d03430c82f730741011cb4a70ebff00e824f9eb96443d66b4cffe828f70e5958")

build() {
  cd $pkgname-$pkgver/app-linux
  python -c "from setuptools import setup; setup()" build
}

package() {
  cd $pkgname-$pkgver/app-linux
  python -c "from setuptools import setup; setup()" install --root="$pkgdir" --optimize=1
}
