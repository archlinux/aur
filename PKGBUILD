# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-testflo
pkgver=1.4.5
pkgrel=1
pkgdesc="A simple flow-based testing framework"
url="https://github.com/OpenMDAO/testflo"
license=('Apache')
arch=('any')
depends=('python-coverage')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/t/testflo/testflo-$pkgver.tar.gz")
sha512sums=('12e1d61546276278ca43865e6745c2620ae6380ff35096afece8f2d9b0f572d352f499b21b1109860222c6e0ea1e71ebbdb9f62de25eeeb08f6e1d32c3a70052')

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
