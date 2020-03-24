# Maintainer: Jozef Riha <jose1711 at gmail dot com>
# Co-Maintainer: Erik Fleckstein <erik at tinkerforge dot com>
# Contributor: tafli
# Contributor: maat

pkgname=brickv
pkgver=2.4.12
pkgrel=1
pkgdesc="testing/flashing tool for tinkerforge brick(let)s"
url="http://www.tinkerforge.com/"
license=("GPL2")
arch=('any')
depends=('python-pyserial' 'python-pyqt5' 'python-pytz' 'python-tzlocal')
optdepends=('brickd: local device support')
makedepends=('python-setuptools')
source=(https://github.com/Tinkerforge/${pkgname}/archive/v${pkgver}.zip)
sha256sums=('bed74afca5e54aebb252de72d3aa8cdfa112e8ee91b6293da40a1cb1ee075418')

build() {
  cd $srcdir/$pkgname-$pkgver/src
  python build_src.py
}

package() {
  cd $srcdir/$pkgname-$pkgver/src
  python setup.py install --root=$pkgdir --prefix=/usr
}
