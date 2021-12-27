# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname=oscclip
pkgver=0.2.1
pkgrel=2
pkgdesc='Utilities for managing the clipboard using OSC52'
arch=(any)
url="https://codeberg.org/rumpelsepp/oscclip"
license=("GPLv3")
depends=("python")
makedepends=("python-setuptools")
optdepends=()
source=("https://codeberg.org/rumpelsepp/oscclip/archive/v${pkgver}.tar.gz")
sha256sums=('64e3d207fa01bc97ce648267bc2b4eb185836ee50a6dd9f23b5009e3ca1e4424')

build() {
    cd "$pkgname"
    export PYTHONHASHSEED=0
    python -c "from setuptools import setup; setup()" build
}

package() {
    cd "$pkgname"
    python -c "from setuptools import setup; setup()" install --root="${pkgdir}/" --optimize=1 --skip-build
}
