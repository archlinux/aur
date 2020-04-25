# Maintainer: Ingo Heimbach <i.heimbach@fz-juelich.de>

pkgname="git-clog"
pkgver="0.2.5"
pkgrel="1"
pkgdesc="A tool to colorize the commit graph of a Git repository by interpreting the first six commit hash digits as an RGB color value."
arch=("any")
url="https://github.com/IngoHeimbach/git-clog"
license=("MIT")
depends=("python")
makedepends=("python-setuptools")
source=("https://github.com/IngoHeimbach/git-clog/archive/v${pkgver}.tar.gz")
sha256sums=("74199a3e7f87ffaf3229a0b46bf594707932231aaae8588344a64d47c892b5dc")

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
