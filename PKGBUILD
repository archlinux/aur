# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-testflo
pkgver=1.3.4
pkgrel=3
pkgdesc="A simple flow-based testing framework"
url="https://github.com/RaRe-Technologies/testflo"
license=('Apache')
arch=('any')
depends=('python-six' 'python-coverage')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/t/testflo/testflo-$pkgver.tar.gz")
sha512sums=('9d2466eb5ebc844632fba4eabd3f453af61cde0788f27c5f23ea383661fb27b19496cc42064f0b0a58537ba6e5661d8c948344449f5717a262d8725c7ff9c5ac')

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
