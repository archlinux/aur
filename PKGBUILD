# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>

pkgname=python-bleak
_pkgname=bleak
pkgver=0.11.0
pkgrel=2
pkgdesc="Bluetooth Low Energy platform Agnostic Klient for Python"
arch=(any)
url='https://github.com/hbldh/bleak'
license=(MIT)
depends=('python' 'python-dbus-next' 'python-service-identity')
checkdepends=('python-pytest' 'python-pytest-cov' 'python-pytest-runner')
makedepends=('python-setuptools')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/hbldh/$_pkgname/archive/v$pkgver.tar.gz")
sha256sums=("81b864482745c6082f1f8155d93695011277e998f5563f6106da80ae7f6c052c")

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
