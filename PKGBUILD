pkgname=foxaur
pkgver=0.0.1
pkgrel=1
pkgdesc="Pacman wrapper and AUR helper to keep it simple."
arch=('any')
url="https://gitlab.com/foxaur/foxaur"
license=('GNU General Public License v3.0')
depends=(
    'python>=3.7'
    'pacman>=5.1'
    'git>=2.19'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::https://gitlab.com/foxaur/foxaur/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz"
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
