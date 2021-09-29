# Maintainer: Oystein Sture <oysstu@gmail.com>
# Contributor: 

pkgname=python-utm
pkgver=0.7.0
pkgrel=1
pkgdesc="Bidirectional UTM-WGS84 converter for python"
arch=("any")
license=("MIT")
url="https://github.com/Turbo87/utm"
depends=('python')
optdepends=('python-numpy')
makedepends=()
source=("https://github.com/Turbo87/utm/archive/v${pkgver}.tar.gz")
sha256sums=('1dd235fc40eaa59f6691d481563d8aad0504f388014248b744a53a5c075f567c')

build() {
    cd "utm-${pkgver}"
    python setup.py build
}

package() {
    cd "utm-${pkgver}"
    python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
