# Maintainer: Oystein Sture <oysstu@gmail.com>
# Contributor: 

pkgname=python-utm
pkgver=0.5.0
pkgrel=1
pkgdesc="Bidirectional UTM-WGS84 converter for python"
arch=("any")
license=("MIT")
url="https://github.com/Turbo87/utm"
depends=('python')
optdepends=('python-numpy')
makedepends=()
source=("https://github.com/Turbo87/utm/archive/v${pkgver}.tar.gz")
sha256sums=('b1f930ce5a66bcfb913c824fe1abfc637dca389670107c03cb811f2dbea50228')

build() {
    cd "utm-${pkgver}"
    python setup.py build
}

package() {
    cd "utm-${pkgver}"
    python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
