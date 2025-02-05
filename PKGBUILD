# Maintainer: jacopotediosi <jacopotediosi at gmail dot com>

pkgname=flask-unsign
pkgver=1.2.1
pkgrel=1

pkgdesc="Command line tool to fetch, decode, brute-force and craft session cookies of a Flask application by guessing secret keys"
arch=('any')
url="https://github.com/Paradoxis/Flask-Unsign"
license=('MIT')

depends=('python' 'python-flask' 'python-requests' 'python-itsdangerous' 'python-markupsafe' 'python-werkzeug')
makedepends=('python-build' 'python-installer' 'python-wheel')

# Hashes updated by updpkgsums
sha256sums=('2b70955b6599effff3773b6de5bd44828c43d92a3fb64ab4db96b754363afd25')

source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/${pkgname//-/_}-$pkgver.tar.gz")

build() {
    cd "$srcdir/${pkgname//-/_}-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${pkgname//-/_}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
