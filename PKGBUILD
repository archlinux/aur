# Maintainer: Jonas Bengtsson <jonas@bengtsson.cc>

pkgname=anidb-mv
pkgver=0.1
pkgrel=1
pkgdesc="Command line client for AniDB"
arch=(any)
url="https://github.com/ljb/anidb-mv"
license=(GPL3)
depends=(python)
source=(https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('d08db0fe1fb7969c3dba27c32b37e0fae6a12073c422f74fecc3205bc6b61eb7')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
