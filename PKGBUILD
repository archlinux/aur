# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname=oscclip
pkgver=0.1.0
pkgrel=1
pkgdesc='Utilities for managing the clipboard using OSC52'
arch=(any)
url="https://codeberg.org/rumpelsepp/oscclip"
license=("GPLv3")
depends=("python")
makedepends=("python-setuptools")
optdepends=()
source=("https://codeberg.org/rumpelsepp/oscclip/archive/v${pkgver}.tar.gz")
sha256sums=('beb71f7e67af652ffaf5f08dd106ecd529adcae1bcfb501fcb001184362b0167')

build() {
    cd "$pkgname"
    export PYTHONHASHSEED=0
    python -c "from setuptools import setup; setup()" build
}

package() {
    cd "$pkgname"
    python -c "from setuptools import setup; setup()" install --root="${pkgdir}/" --optimize=1 --skip-build
}
