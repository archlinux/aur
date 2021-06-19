# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>

pkgname=python-bleak
_pkgname=bleak
pkgver=0.12.0
pkgrel=1
pkgdesc="Bluetooth Low Energy platform Agnostic Klient for Python"
arch=(any)
url='https://github.com/hbldh/bleak'
license=(MIT)
depends=('python' 'python-dbus-next' 'python-service-identity')
checkdepends=('python-pytest' 'python-pytest-cov' 'python-pytest-runner')
makedepends=('python-setuptools')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/hbldh/$_pkgname/archive/v$pkgver.tar.gz")
sha512sums=('fa4e7a072a40f7a2f0716aac4fc0a38fe275d16545473d2bad65607b120e291e3e2ab3405c8346eb235ac736df990aff418f5e8628d867fa4adeb01edfabf4ab')

build() {
  cd $_pkgname-$pkgver

  python setup.py build
}

check() {
	cd $_pkgname-$pkgver

	pytest
}

package() {
  cd $_pkgname-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=2 sw=2 et:
