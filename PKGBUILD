# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>

pkgname="python-github-binary-upload"
pkgver="0.1.9"
pkgrel="1"
pkgdesc="A Python package which creates simple interactive menus on the command line."
arch=("any")
url="https://github.com/sciapp/github-binary-upload"
license=("MIT")
depends=("python" "python-requests" "python-yacl")
makedepends=("python-setuptools")
source=("https://github.com/sciapp/github-binary-upload/archive/v${pkgver}.tar.gz")
sha256sums=("77aabb5a9c5179602d0661c1122528fb442ad4a623c42acd56f470cc55671cbb")

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
