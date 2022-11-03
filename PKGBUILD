# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>

pkgname="python-github-binary-upload"
pkgver="0.1.10"
pkgrel="1"
pkgdesc="A Python package which creates simple interactive menus on the command line."
arch=("any")
url="https://github.com/sciapp/github-binary-upload"
license=("MIT")
depends=("python" "python-requests" "python-yacl")
makedepends=("python-setuptools")
source=("https://github.com/sciapp/github-binary-upload/archive/v${pkgver}.tar.gz")
sha256sums=("90238b6d6273f1532e20274a0b7ff9dc18eaa1eb1c58ca527fe7a44fb5800897")

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
