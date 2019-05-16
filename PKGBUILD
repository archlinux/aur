# Maintainer: Lari Tikkanen <lartza@wippies.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>

pkgname=python2-venusian
_pkgname=venusian
pkgver=1.2.0
pkgrel=2
pkgdesc="A library for deferring decorator actions."
license=('custom:BSD')
arch=('any')
url="https://pylonsproject.org"
depends=('python2')
makedepends=('python2-setuptools')
source=(https://pypi.python.org/packages/source/v/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('64ec8285b80b110d0ae5db4280e90e31848a59db98db1aba4d7d46f48ce91e3e')

build() {
  cd $_pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
