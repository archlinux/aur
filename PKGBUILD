# Maintainer: Štěpán Mikéska <stepan@nesp.im>
pkgname=pisek
pkgver=2.3.2
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
sha256sums=('cfa764d520cd61f52d6bb6d48c4ef55d956a6e08907effb16ca21b6c5f586b78')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
