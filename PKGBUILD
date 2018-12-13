#Maintainer: Konrad Partas <konparta at gmail dot com>

pkgname=aquamonitor
pkgver=0.0.1
pkgrel=1
pkgdesc="Simple application to monitor conditions in the aquarium."
arch=(
    'armv6h'
    'armv7h'
)
url="https://gitlab.com/auqamonitor/aquamonitor"
license=('GNU General Public License v3.0')
depends=(
    'python>=3.7'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::https://gitlab.com/aquamonitor/aquamonitor/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz"
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
