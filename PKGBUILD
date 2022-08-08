# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-testflo
pkgver=1.4.9
pkgrel=1
pkgdesc="A simple flow-based testing framework"
url="https://github.com/OpenMDAO/testflo"
license=('Apache')
arch=('any')
depends=('python-coverage')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/t/testflo/testflo-$pkgver.tar.gz")
sha512sums=('b9fff4cbfd432176d8b2ae0f38fcced0afb95b908009f09e9d08fc2d0e07f1c3f9fe58e773ae2a62bd4dc9722da4fa2a9bbd14a53e85db3d12ce0bd957755658')

prepare() {
  cd testflo-$pkgver
  sed -i 's/coverage<5.0/coverage/' setup.py
}

build() {
  cd testflo-$pkgver
  python setup.py build
}

package() {
  cd testflo-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
