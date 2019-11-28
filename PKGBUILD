# Maintainer: Ray Xu <megrxu at gmail dot com>
pkgname=python-archiveis
_name=archiveis
pkgver=0.0.8
pkgrel=3
pkgdesc='A simple Python wrapper for the archive.is capturing service.'
arch=('any')
url="https://github.com/pastpages/archiveis"
license=('MIT')
depends=('python' 'python-click')
source=("https://github.com/pastpages/archiveis/archive/v${pkgver}.tar.gz")
makedepends=('python-setuptools')
md5sums=('3990c2864f346623dcdc34ed731497c7')

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

