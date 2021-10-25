# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname=oscclip
pkgver=0.2.0
pkgrel=1
pkgdesc='Utilities for managing the clipboard using OSC52'
arch=(any)
url="https://codeberg.org/rumpelsepp/oscclip"
license=("GPLv3")
depends=("python")
makedepends=("python-setuptools")
optdepends=()
source=("https://codeberg.org/rumpelsepp/oscclip/archive/v${pkgver}.tar.gz")
sha256sums=('631d3edd5518590ac53c6e597846a2a771d13b87a1fe390b56fe5ac7fc65edec')

build() {
    cd "$pkgname"
    export PYTHONHASHSEED=0
    python -c "from setuptools import setup; setup()" build
}

package() {
    cd "$pkgname"
    python -c "from setuptools import setup; setup()" install --root="${pkgdir}/" --optimize=1 --skip-build
}
