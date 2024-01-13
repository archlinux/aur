# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=python-preggy
_name=${pkgname#python-}
pkgver=1.4.4
pkgrel=1
pkgdesc="assertion library for Python"
arch=(any)
url="https://github.com/heynemann/preggy"
license=(MIT)
depends=(python-six python-colorama python-unidecode)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
source=("https://github.com/heynemann/preggy/archive/refs/tags/$pkgver.tar.gz")
b2sums=('8d600e1c1e1e2948c31e7dbec907d87bd3590dfdecb22ee22a3f75ca65f22d50bc204fd0751327ac8ca22856d84f2ee7ddc1b42710f956e9c22b3e72d6047a65')

build() {
  cd $_name-$pkgver
  python setup.py build
}

check() {
  cd $_name-$pkgver
  pytest
}

package() {
  cd $_name-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
