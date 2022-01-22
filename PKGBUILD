# Maintainer: Lari Tikkanen <lartza@wippies.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>

pkgname=python2-venusian
_pkgname=venusian
pkgver=2.1.0
pkgrel=1
pkgdesc="A library for deferring decorator actions."
license=('custom:BSD')
arch=('any')
url="https://pylonsproject.org"
depends=('python2')
makedepends=('python2-setuptools')
source=(https://pypi.python.org/packages/source/v/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('b3445f038426f1a8fe4c8a45c2659329a96377778564f947c0138c36dc120144')

build() {
  cd $_pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
