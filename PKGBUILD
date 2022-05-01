# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>

pkgname=python-bleak
_pkgname=bleak
pkgver=0.14.3
pkgrel=1
pkgdesc="Bluetooth Low Energy platform Agnostic Klient for Python"
arch=(any)
url='https://github.com/hbldh/bleak'
license=(MIT)
depends=('python' 'python-dbus-next' 'python-service-identity')
# checkdepends=('python-pytest' 'python-pytest-cov' 'python-pytest-runner')
makedepends=('python-setuptools' 'bluez-utils')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/hbldh/$_pkgname/archive/v$pkgver.tar.gz")
sha512sums=('f227177c98d617b57df3fddb5763a892546385e2c2d376dfa66dd3e9c72cdf544fd8ebeb8f79daa96444169fbecc031dc4ebffb4c50462355c16ab507cf2f799')

build() {
  cd $_pkgname-$pkgver

  python setup.py build
}

# check() {
	# cd $_pkgname-$pkgver

	# pytest
# }

package() {
  cd $_pkgname-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=2 sw=2 et:
