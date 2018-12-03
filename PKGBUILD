# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-testflo
pkgver=1.3.3
pkgrel=1
pkgdesc="A simple flow-based testing framework"
url="https://github.com/RaRe-Technologies/testflo"
license=('Apache')
arch=('any')
depends=('python-six' 'python-coverage')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/t/testflo/testflo-$pkgver.tar.gz")
sha512sums=('cf3d8c53a5b7364f6261c391753651efc8b1eaa9785968d52eb182c88d51cdcfd199ca0d645ea01c0c87e3fe2163d17780c59c46cdac7e9aaefc3190d6bd2997')

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
