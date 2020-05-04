# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=torf-cli
pkgver=3.1.1
pkgrel=1
pkgdesc='A tool for creating, reading and editing torrent files'
arch=('any')
url='https://github.com/rndusr/torf-cli/'
license=('GPL3')
depends=('python' 'python-torf' 'python-pyxdg')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/rndusr/torf-cli/archive/v${pkgver}.tar.gz")
sha256sums=('2d14e777c3d218bdacf435328da036f39858658b844b8ad672bb25332e74324c')

build() {
    cd "${pkgname}-${pkgver}"
    python setup.py build
}

check() {
    cd "${pkgname}-${pkgver}"
    PYTHONPATH="$(pwd)/build/lib" pytest
}

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir" --skip-build --optimize='1'
}
