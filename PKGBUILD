#Maintainer: Konrad Partas <konparta at gmail dot com>

pkgname=gfoxaur
pkgver=0.0.1
pkgrel=1
pkgdesc="GUI for FoxAUR - simple Pacman wrapper and AUR helper."
arch=('any')
url="https://gitlab.com/foxaur/gfoxaur"
license=('GNU General Public License v3.0')
depends=(
    'python>=3.7'
    'python-pyqt5'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::https://gitlab.com/foxaur/gfoxaur/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz"
)
md5sums=(
    "SKIP"
)

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    python setup.py install --root="$pkgdir/" --skip-build
}
