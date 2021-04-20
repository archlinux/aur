# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-testflo
pkgver=1.4.5.1
pkgrel=1
pkgdesc="A simple flow-based testing framework"
url="https://github.com/OpenMDAO/testflo"
license=('Apache')
arch=('any')
depends=('python-coverage')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/t/testflo/testflo-$pkgver.tar.gz")
sha512sums=('9c803e897426b89e6b0e4d8c949f8a26614f11f0e2ca81cb27129a539d5f6d6127d0e9cc2a7521191889d2d85d54e6d207730521b1d4457c3a82a006d1c7777d')

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
