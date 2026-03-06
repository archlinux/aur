# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-some-flask-helpers
pkgver=0.2.10
pkgrel=1
_commit=e75b9e0
pkgdesc="Generic tools for Flask applications"
arch=('any')
url="https://github.com/marcus67/some_flask_helpers"
license=('GPL-3.0-or-later')
depends=('python-flask' 'python-requests' 'python-werkzeug')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname::git+$url#commit=${_commit}?signed")
sha256sums=('72d26e4f56fe14256fc128c45e405701a0efcd49d525e4ea59006fa5b607aad5')
validpgpkeys=('75D11C9B6734A07B044F3FEB49382A9B7F488EF2')

build() {
    cd "$pkgname"
    python -m build --wheel --no-isolation
}

check() {
    cd "$pkgname"
    python -m unittest discover
}

package() {
    cd "$pkgname"
    python -m installer --destdir="$pkgdir/" dist/*.whl
}
