# Maintainer: a821
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=python-msgpack-numpy
pkgver=0.4.8
pkgrel=1
pkgdesc="Serialize numpy arrays using msgpack"
url="https://pypi.org/project/msgpack-numpy/"
depends=(python-numpy
         python-msgpack)
makedepends=(python-setuptools)
license=(BSD)
arch=(any)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lebedov/msgpack-numpy/archive/${pkgver}.tar.gz")
sha256sums=('730a6fab30bf6656003d7322a834b3673a36a85949d0539d504665f63cd95a44')

build() {
    cd "msgpack-numpy-${pkgver}"
    python setup.py build
}

check() {
    cd "msgpack-numpy-${pkgver}"
    python setup.py test
}

package() {
    cd "msgpack-numpy-${pkgver}"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
