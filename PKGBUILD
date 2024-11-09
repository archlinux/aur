# Maintainer: jacopotediosi <jacopotediosi at gmail dot com>

_pkgname=flask-unsign
pkgname=python-$_pkgname
pkgver='1.2.0'
pkgrel=1

pkgdesc="Command line tool to fetch, decode, brute-force and craft session cookies of a Flask application by guessing secret keys."
arch=('any')
url="https://github.com/Paradoxis/Flask-Unsign"
license=('MIT')

depends=('python' 'python-flask' 'python-requests' 'python-itsdangerous' 'python-markupsafe' 'python-werkzeug')
makedepends=('python-build' 'python-installer' 'python-wheel')

# Hashes updated by updpkgsums
sha256sums=('ff685e5a9e54958d401ddee8d2899c43ad0643df4cf41af844b00a0650ae7b6e')

source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
