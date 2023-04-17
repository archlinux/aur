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
depends=("python")
source=("https://github.com/tdorssers/TeslaPy/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8914b5a753b98e6eaef671dbb1625eb7439732ebb5be9846bff1e7be5d025973')

build() {
  cd ulid_transform-$pkgver
  python setup.py build
}


package() {
  cd ulid_transform-$pkgver
  python setup.py install --root="$pkgdir" --skip-build --optimize=1
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et
