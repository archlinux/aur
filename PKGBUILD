# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname="python-flake8-comprehensions"
_pkgname="flake8-comprehensions"
pkgver=3.10.1
pkgrel=1
pkgdesc="Flake8 plugin to help you write better list/set/dict comprehensions."
arch=('any')
url="https://github.com/adamchainz/${_pkgname}"
license=('ISC')
depends=('flake8')
makedepends=('python-setuptools' 'python-build' 'python-wheel' 'python-installer')
source=("https://github.com/adamchainz/flake8-comprehensions/archive/$pkgver.tar.gz")
md5sums=('0f03c81f624aefb93138eb7a01d391cc')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
