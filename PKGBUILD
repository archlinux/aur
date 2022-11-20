# Maintainer: Jelle van der Waa <jelle@archlinux.org>

pkgname=python38-asgiref
pkgver=3.5.2
pkgrel=1
pkgdesc="Reference ASGI adapters and channel layers"
arch=(any)
url="http://github.com/django/asgiref"
license=('BSD')
makedepends=('python38-setuptools')
checkdepends=(python38-pytest python38-pytest-asyncio)
depends=('python38')
source=("https://pypi.io/packages/source/a/asgiref/asgiref-${pkgver}.tar.gz")
sha256sums=('4a29362a6acebe09bf1d6640db38c1dc3d9217c68e6f9f6204d72667fc19a424')

build() {
    cd "asgiref-${pkgver}"
    python3.8 setup.py build
}

check() {
    cd "asgiref-${pkgver}"
    PYTHONPATH=. pytest .
}

package() {
    cd "asgiref-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1

    install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
