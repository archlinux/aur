# Maintainer: Moonlit Tune <moonlit underscore tune at protonmail dot com>

pkgname=loramon
pkgver=0.9.7
pkgrel=2
pkgdesc="LoRa packet sniffer for RNode hardware"
arch=('any')
depends=('python-pyserial')
makedepends=('python-setuptools')
url="https://github.com/markqvist/loramon"
license=('MIT')
source=(https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/${pkgname//-/_}-$pkgver.tar.gz)
source=($pkgname-$pkgver::$url/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('8aefca898f28a24e9d9b225b0c4d94c5ca1e3e44b6a6882fe6c3b20c0d2fa387')

build() {
  cd "$srcdir/LoRaMon-$pkgver"

  python setup.py build
}

package() {
  cd "$srcdir/LoRaMon-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1
}
