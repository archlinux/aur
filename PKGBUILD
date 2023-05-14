# Maintainer: GI Jack <GI_Jack@hackermail.com>

# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Tarmo Heiskanen <turskii@gmail.com>

pkgname=python-flask1
pkgver=1.1.4
pkgrel=3
pkgdesc='Micro webdevelopment framework for Python(1.x Branch)'
url='http://flask.pocoo.org/'
arch=('any')
license=('custom:BSD')
provides=("python-flask=1.1.4")
conflicts=("python-flask")
depends=('python-werkzeug' 'python-jinja' 'python-itsdangerous' 'python-click')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pallets/flask/archive/${pkgver}.tar.gz")
sha512sums=('e7ca33d599c0f7b83542620e827c999124ffe30e31006815b49993a81f9cf0d61dd0433b73f57f922da5aeb76101beccfe63d9a7236e1850e326f838dc1f453f')

build() {
    cd "flask-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "flask-$pkgver"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE.rst "$pkgdir/usr/share/licenses/$pkgname/LICENSE.rst"
}
