# Maintainer: Oystein Sture <oysstu@gmail.com>
# Contributor: 

pkgname=python-utm
pkgver=0.9.0
pkgrel=1
pkgdesc="Bidirectional UTM-WGS84 converter for python"
arch=("any")
license=("MIT")
url="https://github.com/Turbo87/utm"
depends=('python')
optdepends=('python-numpy')
makedepends=()
source=("https://github.com/Turbo87/utm/archive/v${pkgver}.tar.gz")
sha256sums=('e2b80b42730dad0fe7783081251a50825a0927783cc4f71d024409688a4fa293')

build() {
    cd "utm-${pkgver}"
    python setup.py build
}

package() {
    cd "utm-${pkgver}"
    python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
