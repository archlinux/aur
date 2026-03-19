# Maintainer: Štěpán Mikéska <stepan@nesp.im>
pkgname=pisek
pkgver=2.3.1
pkgrel=1
pkgdesc='Tool for developing tasks for programming competetions'
url='https://github.com/piskoviste/pisek'
depends=('python>=3.11.0' python-colorama python-argcomplete python-pydantic python-readchar diffutils gcc)
makedepends=(python-build python-installer python-wheel python-setuptools)
checkdepends=()
provides=("${pkgname}")
conflicts=("${pkgname}")
license=('GPL-3.0-or-later')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/piskoviste/pisek/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('618af8c228026b3265c4b2e902507977458bf334f0dd8bc67336c77baaaffe7e')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
