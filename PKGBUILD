# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>

pkgname=python-bleak
_pkgname=bleak
pkgver=0.13.0
pkgrel=1
pkgdesc="Bluetooth Low Energy platform Agnostic Klient for Python"
arch=(any)
url='https://github.com/hbldh/bleak'
license=(MIT)
depends=('python' 'python-dbus-next' 'python-service-identity')
checkdepends=('python-pytest' 'python-pytest-cov' 'python-pytest-runner')
makedepends=('python-setuptools')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/hbldh/$_pkgname/archive/v$pkgver.tar.gz")
sha512sums=('31ddf5deba8ce18f150fa1a8e4026f3c7aa470516ed9d58523bf37d8ecfb57ad47e7d96298a83f5a076eed1cc7e0662d1b26f3cbc474818561d274bdc010d8ca')

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
