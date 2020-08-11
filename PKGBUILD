# Maintainer: udaemon <soffioalcuore@posteo.net>
pkgname=soundcraft-utils
pkgver=0.3.4
pkgrel=1
pkgdesc="Linux Utilities for Soundcraft Notepad Mixers"
arch=('any')
url="https://github.com/lack/soundcraft-utils"
license=('MIT')
depends=('python>=3.6')
install=soundcraft-utils.install
source=(${url}/archive/v${pkgver}.tar.gz)
md5sums=('SKIP')

build() {
    cd "${pkgname}-${pkgver}"
    python3 setup.py build
}

package() {
    cd "${pkgname}-${pkgver}"
    python3 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
