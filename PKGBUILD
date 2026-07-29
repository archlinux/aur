# Maintainer: Ingo Meyer <IJ_M@gmx.de>

pkgname="git-clog"
pkgver="0.3.3"
pkgrel="1"
pkgdesc="A tool to colorize the commit graph of a Git repository by interpreting the first six commit hash digits as an RGB color value."
arch=("any")
url="https://github.com/IngoMeyer441/git-clog"
license=("MIT")
depends=("python")
makedepends=("python-setuptools")
source=("https://github.com/IngoMeyer441/git-clog/archive/v${pkgver}.tar.gz")
sha256sums=("ba47b4b0ba2c8622af8d44a4f369048cfd68f3f8650479f01a2bc1ece203f4c7")

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
