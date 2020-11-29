pkgname=python-dxfgrabber
pkgver=1.0.1
pkgrel=1
pkgdesc="A Python library to grab information from DXF drawings - all DXF versions supported."
url="https://github.com/mozman/dxfgrabber.git"
depends=(python)
makedepends=('python-setuptools')
license=('custom')
arch=('x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mozman/dxfgrabber/archive/v${pkgver}.tar.gz")
sha256sums=('86e7fa7c186f8c48bf0f7ca5e3cb5df319be8cddf56ba4ea4a95c29c3a251856')


build() {
    cd dxfgrabber-${pkgver}
    python setup.py build
}

package() {
    cd dxfgrabber-${pkgver}
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
