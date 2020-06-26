# Maintainer: Ingo Heimbach <i.heimbach@fz-juelich.de>

pkgname="python-github-binary-upload"
pkgver="0.1.5"
pkgrel="1"
pkgdesc="A Python package which creates simple interactive menus on the command line."
arch=("any")
url="https://github.com/sciapp/github-binary-upload"
license=("MIT")
depends=("python" "python-requests" "python-yacl")
makedepends=("python-setuptools")
source=("https://github.com/sciapp/github-binary-upload/archive/v${pkgver}.tar.gz")
sha256sums=("5cac6e88d575a800874cfa23467bb4792149d48a7927e0a2c92efbd42d9c075d")

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
