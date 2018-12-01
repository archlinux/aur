# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-testflo
pkgver=1.3.2
pkgrel=1
pkgdesc="A simple flow-based testing framework"
url="https://github.com/RaRe-Technologies/testflo"
license=('Apache')
arch=('any')
depends=('python-six' 'python-coverage')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/t/testflo/testflo-$pkgver.tar.gz")
sha512sums=('481fbca3f725a70198b7dbb4844c3232b2b83103d630ad251efd1a69c18cc46305b4bf4da59d0e63d52eb5838c5f07a82685b77d6f584118100a68f31bb5ae0e')

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
