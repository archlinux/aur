# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-testflo
pkgver=1.3.6
pkgrel=1
pkgdesc="A simple flow-based testing framework"
url="https://github.com/RaRe-Technologies/testflo"
license=('Apache')
arch=('any')
depends=('python-six' 'python-coverage')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/t/testflo/testflo-$pkgver.tar.gz")
sha512sums=('4f409edfa88f9cc0be8af572f2285a7ed5fe1fa99860bbb31b305b98cc11606012bdd53c3a2b124e07f5a7e8e46c893f947d99c209db0ce97062be8c4ff79064')

prepare() {
  cd testflo-$pkgver
  sed -i 's/from distutils.core/from setuptools/' setup.py
}

build() {
  cd testflo-$pkgver
  python setup.py build
}

package() {
  cd testflo-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
