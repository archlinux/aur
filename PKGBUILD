# Maintainer: Ingo Heimbach <i.heimbach@fz-juelich.de>

pkgname="python-github-binary-upload"
pkgver="0.1.4"
pkgrel="1"
pkgdesc="A Python package which creates simple interactive menus on the command line."
arch=("any")
url="https://github.com/sciapp/github-binary-upload"
license=("MIT")
depends=("python" "python-requests" "python-yacl")
makedepends=("python-setuptools")
source=("https://github.com/sciapp/github-binary-upload/archive/v${pkgver}.tar.gz")
sha256sums=("35d8c226173dcbd94a1d771f69b5cae5e122cdb49795efac1ac3dff6c86216e5")

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
