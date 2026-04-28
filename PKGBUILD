# Maintainer: Eragon <eragon at eragon dot re>
# Contributor: Nigel Kukard <nkukard@lbsd.net>
# Contributor: Serge Victor <arch@random.re>

_name=flask-debugtoolbar
pkgname=python-flask-debugtoolbar
pkgver=0.16.0
pkgrel=0
pkgdesc="A toolbar overlay for debugging Flask applications"
arch=('any')
url="https://flask-debugtoolbar.readthedocs.io/"
license=('BSD')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'python-flit-core')
depends=('python-blinker' 'python-flask' 'python-werkzeug' 'python-itsdangerous')
source=("$_name-$pkgver.tar.gz::https://github.com/pallets-eco/flask-debugtoolbar/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('fecd16c38fae240988976d60fc8872385498012831640818609cca67d49b68e2')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

