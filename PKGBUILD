# Maintainer: Agil Mammadov <mammadovagil@proton.me>
# Contributor: Ivan Batrakov <blackfan321 at disroot dot org>
# Contributor: NIgel Kukard <nkukard at LBSD dot net>
# Contributor: RcrdBrt

pkgname=python-flask-admin
_pkgname=flask-admin
_name=flask_admin
pkgver='2.2.0'
pkgrel=1
pkgdesc="Simple and extensible admin interface framework for Flask"
url="https://github.com/flask-admin/flask-admin/"
depends=(python python-flask python-jinja python-markupsafe python-werkzeug python-wtforms)
makedepends=(python-build python-installer python-wheel python-flit)
license=('BSD-3-Clause')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('4a5b844789c10076da89320563600a7addf781e73ab315ae800521b3ec018509')

build() {
    cd "$srcdir/$_name-$pkgver"
    python3 -m build --wheel
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
