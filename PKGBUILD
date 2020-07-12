# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Mathieu Westphal <mathieu.westphal@gmail.com>

pkgname=python2-spidev
pkgver=3.5
pkgrel=1
pkgdesc="Python2 bindings for Linux SPI access through spidev"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://pypi.org/project/spidev/"
license=('GPL')
depends=('python2-setuptools')
makedepends=('git')
source=("https://pypi.python.org/packages/source/s/spidev/spidev-${pkgver}.tar.gz")
sha256sums=('8a7f5c289f161ea2ac4697fa8a10918232c990678dd0053084b3c43b1363910d')

build() {
  cd "$srcdir/spidev-${pkgver}"
  python2 setup.py build
}

package() {
  cd "$srcdir/spidev-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
