# Maintainer: Ray Xu <megrxu at gmail dot com>
pkgname=python-archiveis
_name=archiveis
pkgver=0.0.9
pkgrel=2
pkgdesc='A simple Python wrapper for the archive.is capturing service.'
arch=('any')
url="https://github.com/pastpages/archiveis"
license=('MIT')
depends=('python' 'python-click')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pastpages/archiveis/archive/v${pkgver}.tar.gz")
makedepends=('python-setuptools')
md5sums=('2e3c23c2fc2f5c68cfde7746e35397be')

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

