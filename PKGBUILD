# Maintainer: Deon Spengler <deon@spengler.co.za>

pkgname=python-luma-core
pkgver=2.5.3
pkgrel=1
pkgdesc="Pillow-compatible library to support drawing and text-rendering for small displays"
arch=('any')
url='https://github.com/rm-hull/luma.core'
license=('MIT')
depends=(python-pillow python-smbus2)
makedepends=(python-setuptools)
source=("$pkgname-$pkgver.tar.gz::https://github.com/rm-hull/luma.core/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('c87414d8f3f5f4e0cfa06e265862d27a890506d26c0f7f1fe6c5ec8b85aa7d46')

build() {
  cd "luma.core-$pkgver"
  python setup.py build
}

package() {
  cd "luma.core-$pkgver"
  python setup.py install --optimize=1 --root="${pkgdir}/"
  install -D -m644 LICENSE.rst "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
