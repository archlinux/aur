# Maintainer: Deon Spengler <deon@spengler.co.za>

pkgname=python-luma-core
pkgver=2.4.2
pkgrel=1
pkgdesc="Pillow-compatible library to support drawing and text-rendering for small displays"
arch=('any')
url='https://github.com/rm-hull/luma.core'
license=('MIT')
depends=(python-pillow python-smbus2)
makedepends=(python-setuptools)
source=("$pkgname-$pkgver.tar.gz::https://github.com/rm-hull/luma.core/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('8ad1ac035a82fc729a4f5bb70ec7501322bd458af4888ed8c225b99a30c428f9')

build() {
  cd "luma.core-$pkgver"
  python setup.py build
}

package() {
  cd "luma.core-$pkgver"
  python setup.py install --optimize=1 --root="${pkgdir}/"
  install -D -m644 LICENSE.rst "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
