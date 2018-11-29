# Maintainer: Ray Xu <megrxu at gmail dot com>
pkgname=python-archiveis
_name=archiveis
pkgver=0.0.6
pkgrel=2
pkgdesc='A simple Python wrapper for the archive.is capturing service.'
arch=('any')
url="https://github.com/pastpages/archiveis"
license=('MIT')
depends=('python')
source=("https://github.com/pastpages/archiveis/archive/v${pkgver}.tar.gz")
md5sums=('93b712368248d1208509bf4b9657bed3')
makedepends=('python-setuptools')

build() {
    cd ${_name}-${pkgver}
    python setup.py build
}

package() {
    cd ${_name}-${pkgver}
    mkdir -p $pkgdir/usr/share/licenses/$pkgname/
    cp LICENSE $pkgdir/usr/share/licenses/$pkgname/
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
