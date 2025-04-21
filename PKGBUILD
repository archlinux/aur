# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Ivan Batrakov <blackfan321 at disroot dot org>
# Contributor: Kevin Puertas <kevinpr@jkanetwork.com>

_name=dnsrecon
pkgname=python-dnsrecon
pkgver=1.3.1
pkgrel=1
pkgdesc='A DNS Enumeration and Scanning tool in Python'
arch=(any)
url="https://github.com/darkoperator/dnsrecon"
license=('GPL-2.0-or-later')
depends=('python-netaddr' 'python-dnspython' 'python-loguru' 'python-lxml' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('41c969d70f389265be8662d307e3145e9a09ab4f75930c721cd32893a63e52d2')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
