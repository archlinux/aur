# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>

pkgname="dwatch"
pkgver="0.0.0"
pkgrel="1"
pkgdesc="A tool to watch command output for differences and send notifications."
arch=("any")
url="https://github.com/IngoMeyer441/dwatch"
license=("MIT")
depends=("python" "python-jinja" "python-yacl")
makedepends=("python-setuptools")
source=("https://github.com/IngoMeyer441/dwatch/archive/v${pkgver}.tar.gz")
sha256sums=("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx")

build() {
    cd "${srcdir}/${pkgname}-${pkgver}" || return
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}" || return
    python setup.py install --optimize=1 \
                            --prefix=/usr \
                            --root="${pkgdir}" \
                            --skip-build
}
