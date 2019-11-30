# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=python-bencoder-pyx
pkgver=2.0.1
pkgrel=1
pkgdesc='A fast bencode implementation in Cython'
arch=('x86_64')
url='https://github.com/whtsky/bencoder.pyx/'
license=('BSD')
depends=('python')
makedepends=('python-setuptools' 'cython')
checkdepends=('python-pytest' 'python-coverage')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/whtsky/bencoder.pyx/archive/v${pkgver}.tar.gz")
sha256sums=('f3ff92ac706a7e4692bed5e6cbe205963327f3076f55e408eb948659923eac72')

build() {
    cd "bencoder.pyx-${pkgver}"
    python setup.py build
}

check() {
    cd "bencoder.pyx-${pkgver}"
    python setup.py test
}

package() {
    cd "bencoder.pyx-${pkgver}"
    python setup.py install --root="$pkgdir" --skip-build --optimize='1'
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
