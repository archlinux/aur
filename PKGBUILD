# Maintainer: user20159 <public[aT]lrose.de>

pkgbase='python-inwx'
pkgname='python-inwx'
pkgver='3.0.5'
pkgrel=1
pkgdesc="Python 3 library for INWX API."
url="https://www.inwx.com/en/offer/api"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://api.github.com/repos/inwx/python-client/zipball/v$pkgver")
sha512sums=('e5dc57f037940a4b9a0783f2a28b817b3dd8367a3f8615f4a7106fd58c14f689f9656a1707940a6bc552eadf3e3db4b391bcdad1607220f1be439a58a95cbea8')

build() {
    cd "${srcdir}/inwx-python-client-64fc08d"
    python setup.py build
}

package() {
    cd "${srcdir}/inwx-python-client-64fc08d"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

