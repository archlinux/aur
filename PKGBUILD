# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-testflo
pkgver=1.4.2
pkgrel=4
pkgdesc="A simple flow-based testing framework"
url="https://github.com/OpenMDAO/testflo"
license=('Apache')
arch=('any')
depends=('python-coverage')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/t/testflo/testflo-$pkgver.tar.gz")
sha512sums=('133475b4d870685e8a836b3bfb25da569664e7f54bf144332da41130107d0b0fb1142d34804d968796c76bc30ac891994ffc4e7c04ea6d73f4ceff406842a6a5')

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
