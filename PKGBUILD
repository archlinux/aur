# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>

pkgname="dwatch"
pkgver="0.2.0"
pkgrel="1"
pkgdesc="A tool to watch command output for differences and send notifications."
arch=("any")
url="https://github.com/IngoMeyer441/dwatch"
license=("MIT")
depends=("python" "python-jinja" "python-yacl")
makedepends=("python-setuptools")
source=("https://github.com/IngoMeyer441/dwatch/archive/v${pkgver}.tar.gz")
sha256sums=("fdb109aefc27809c103496fd6458fc1e5fc66d3caf61764f0983d267d93e23c2")

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
