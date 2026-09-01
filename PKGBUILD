# Maintainer: Eric Busch <me@etbus.ch>
_name=pygeoip
pkgname=python-pygeoip
pkgver=0.3.2
pkgrel=1
pkgdesc="Pure Python API for the MaxMind GeoIP databases"
arch=('any')
url="https://github.com/appliedsec/pygeoip"
license=('LGPL-3.0-or-later')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/ed/65/bb86312b064a6e79c82965202f239850008dbcc9bb24bd0d0bfc7b7bea0b/$_name-$pkgver.tar.gz")
sha256sums=('f22c4e00ddf1213e0fae36dc60b46ee7c25a6339941ec1a975539014c1f9a96d')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
