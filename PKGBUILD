# Maintainer: Eragon <eragon at eragon dot re>
# Contributor: Nigel Kukard <nkukard@lbsd.net>
# Contributor: Serge Victor <arch@random.re>

_name=flask-debugtoolbar
pkgname=python-flask-debugtoolbar
pkgver=0.15.1
pkgrel=0
pkgdesc="A toolbar overlay for debugging Flask applications"
arch=('any')
url="https://flask-debugtoolbar.readthedocs.io/"
license=('BSD')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
depends=('python-blinker' 'python-flask' 'python-werkzeug' 'python-itsdangerous')
source=("$_name-$pkgver.tar.gz::https://github.com/pallets-eco/flask-debugtoolbar/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('d9afb67f344b15ad4e7f61bac5843168bf4c0484709403e292c638a6e303675a')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

