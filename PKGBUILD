# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>

pkgname="python-yacl"
pkgver="0.5.0"
pkgrel="1"
pkgdesc="Yet another color logger for Python."
arch=("any")
url="https://github.com/IngoMeyer441/yacl"
license=("MIT")
depends=("python" "python-pygments")
makedepends=("python-setuptools")
source=("https://github.com/IngoMeyer441/yacl/archive/v${pkgver}.tar.gz")
sha256sums=("ce3c61611a6fa603491f9fde97ce84414b1e3ca3e56010a815dc4bc892765bdc")

build() {
    cd "${srcdir}/${pkgname#*-}-${pkgver}" || return
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname#*-}-${pkgver}" || return
    python setup.py install --optimize=1 \
                            --prefix=/usr \
                            --root="${pkgdir}" \
                            --skip-build
}
