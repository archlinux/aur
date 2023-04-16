# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

_name="ulid-transform"
_module="$_name"

pkgname=("python-$_module")
pkgdesc="Create and transform ULIDs"
pkgver="0.6.3"
pkgrel=1
url="https://github.com/bdraco/ulid-transform"
license=('MIT')
arch=('any')
depends=("python")
source=("https://github.com/bdraco/ulid-transform/releases/download/v${pkgver}/ulid_transform-${pkgver}.tar.gz")
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
