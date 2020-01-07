# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-testflo
pkgver=1.3.5
pkgrel=1
pkgdesc="A simple flow-based testing framework"
url="https://github.com/RaRe-Technologies/testflo"
license=('Apache')
arch=('any')
depends=('python-six' 'python-coverage')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/t/testflo/testflo-$pkgver.tar.gz")
sha512sums=('98462a068363a21685a3a87a1c679a1ea9c965a0ffa8b50043ecd01c729f78073d59290a644ff5b48d5abda795c4d35836e67bf310257a538d8fe30efabc7285')

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
