# Maintainer: Moonlit Tune <moonlit underscore tune at protonmail dot com>

pkgname=loramon
pkgver=0.9.7
pkgrel=1
pkgdesc="LoRa packet sniffer for RNode hardware"
arch=('any')
depends=('python-pyserial')
makedepends=('python-setuptools')
url="https://github.com/markqvist/loramon"
license=('MIT')
source=(https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/${pkgname//-/_}-$pkgver.tar.gz)
sha256sums=('d21c3692836b3870da9625f403288d55c9ab4aa59f6c235b98382ee2f3d36338')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1
}
