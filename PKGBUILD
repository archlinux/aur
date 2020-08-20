# Maintainer: Radek Podgorny <radek@podgorny.cz>

pkgname=python-spidev
_name=spidev
pkgver=3.5
pkgrel=1
pkgdesc="Python bindings for Linux SPI access through spidev"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/doceme/py-spidev"
license=('GPL')
depends=('python')
source=("https://pypi.python.org/packages/source/s/spidev/spidev-$pkgver.tar.gz")
md5sums=('7007e4fff2750025e233d8dfe46be670')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
