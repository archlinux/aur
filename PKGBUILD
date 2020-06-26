# Maintainer: Ingo Heimbach <i.heimbach@fz-juelich.de>

pkgname="python-github-binary-upload"
pkgver="0.1.3"
pkgrel="1"
pkgdesc="A Python package which creates simple interactive menus on the command line."
arch=("any")
url="https://github.com/sciapp/github-binary-upload"
license=("MIT")
depends=("python" "python-requests" "python-yacl")
makedepends=("python-setuptools")
source=("https://github.com/sciapp/github-binary-upload/archive/v${pkgver}.tar.gz")
sha256sums=("30414c7dcc94780603559bcde538e4e2351f0e26eb21e520768baf38750f9232")

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
