# Maintainer: Jonas Bengtsson <jonas@bengtsson.cc>

pkgname=autocrc
pkgver=1.0
pkgrel=1
pkgdesc="Automated CRC-checking"
arch=(any)
url="https://github.com/ljb/autocrc"
license=(GPL3)
depends=(python)
source=(https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('2c8a530cc8571aa388c677c33c3dfc73958273b4aa345c120e63f1940186006e')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
