# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Marco Rubin <marco.rubin@protonmail.com>

pkgname=python-xmpppy
pkgver=0.7.4
pkgrel=1
pkgdesc="Python implementation of XMPP (RFC3920, RFC3921)"
url="https://github.com/xmpppy/xmpppy"
license=(GPL-3.0-only)
arch=(any)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
# checkdepends=(python-pytest python-pytz python-six)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('91b09d7f410a40c644e592f1a7accb685ad457e746a9fd83d7a3a69bf18d3866')

build() {
    cd "xmpppy-$pkgver"
    python -m build --wheel --no-isolation
}

# check() {
#     cd "xmpppy-$pkgver"
#     python -m venv --system-site-packages test-env
#     test-env/bin/python -m installer dist/*.whl
#     test-env/bin/python -P -m pytest -x -o addopts=""
# }

package() {
    cd "xmpppy-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
