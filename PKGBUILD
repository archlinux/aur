# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=python-pyfirmata
pkgver=1.0.3
pkgrel=1
pkgdesc="Python interface for the Firmata"
arch=('any')
url="https://github.com/tino/pyFirmata"
license=('MIT')
depends=('python-pyserial')
makedepends=('python-distribute')
options=(!emptydirs)

source=("https://github.com/tino/pyFirmata/archive/${pkgver}.tar.gz")
md5sums=('d391cf2975c6a48590d4727a3ce85eae')

build() {
  cd "$srcdir"/pyFirmata-$pkgver

  python setup.py build
}

package() {
  cd "$srcdir"/pyFirmata-$pkgver

  python setup.py install --root="$pkgdir"/ --optimize=1

  install -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

