# Maintainer: taotieren <admin@taotieren.com>

pkgname=kibot
pkgver=1.6.3
pkgrel=0
epoch=
pkgdesc="KiCad automation utility"
arch=('any')
url="https://github.com/INTI-CMNB/KiBot"
license=('GPL-3.0')
groups=()
depends=('python' 'kibom' 'pcbdraw' 'kiauto' 'python-yaml')
makedepends=("python-setuptools")
checkdepends=()
optdepends=()
provides=()
conflicts=(kibot-git)
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('9d127beee846cf80cee7892375804ff1bc4b504922618b865447c916295301ba')
#validpgpkeys=()

build() {
    cd "${srcdir}/KiBot-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/KiBot-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
