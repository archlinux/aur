# Maintainer: Štěpán Mikéska <stepan@nesp.im>
pkgname=pisek
pkgver=2.4.1
pkgrel=1
pkgdesc='Tool for developing tasks for programming competitions'
url='https://github.com/piskoviste/pisek'
depends=('python>=3.11.0' python-colorama python-argcomplete python-pydantic python-readchar diffutils gcc)
makedepends=(python-build python-installer python-wheel python-setuptools)
checkdepends=()
provides=("${pkgname}")
conflicts=("${pkgname}")
license=('GPL-3.0-or-later')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/piskoviste/pisek/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f26e8997cd609849ecb26228337e963043cd2a3af0705e2b4c3e4b3d3f6c8359')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
