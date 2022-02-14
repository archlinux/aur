# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-testflo
pkgver=1.4.8
pkgrel=1
pkgdesc="A simple flow-based testing framework"
url="https://github.com/OpenMDAO/testflo"
license=('Apache')
arch=('any')
depends=('python-coverage')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/t/testflo/testflo-$pkgver.tar.gz")
sha512sums=('0c69661cd136b155425229404c742e1630c67429046190ef75c01178e4d1b7cab30421da5aa24aef5afa8e0d33f039b36bb26b4d16b52d32592ace324d1f8f02')

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
