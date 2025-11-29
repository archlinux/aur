# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Ivan Batrakov <blackfan321 at disroot dot org>
# Contributor: Kevin Puertas <kevinpr@jkanetwork.com>

_name=dnsrecon
pkgname=python-dnsrecon
pkgver=1.5.1
pkgrel=1
pkgdesc='A DNS Enumeration and Scanning tool in Python'
arch=(any)
url="https://github.com/darkoperator/dnsrecon"
license=('GPL-2.0-or-later')
depends=(
    'python-dnspython'
    'python-fastapi'
    'python-loguru'
    'python-lxml'
    'python-netaddr'
    'python-requests'
    'python-slowapi'
    'python-stamina'
    'python-ujson'
    'uvicorn')
makedepends=('python-build' 'python-installer' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('a8122173dddc040e9dcbd83fa71c332dc35023bf59e960d9da709b2a519fd1c2')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
