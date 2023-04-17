# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

_name="teslapy"
_module="$_name"

pkgname=("python-$_module")
pkgdesc="A Python implementation of the client side interface to the Tesla Motors Owner API"
pkgver="2.7.0"
pkgrel=1
url="https://github.com/tdorssers/TeslaPy"
license=('MIT')
arch=('any')
depends=("python"
         "python-requests"
         "python-requests-oauthlib"
         "python-websocket-client")
makedepends=("python-setuptools")
source=("https://github.com/tdorssers/TeslaPy/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('88af01cdf322198ead081761606e7a75922ac4f7b07771d7515460e48b4f8ca2')

build() {
  cd TeslaPy-$pkgver
  python setup.py build
}


package() {
  cd TeslaPy-$pkgver
  python setup.py install --root="$pkgdir" --skip-build --optimize=1
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et
