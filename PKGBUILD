# Maintainer: Ingo Heimbach <i.heimbach@fz-juelich.de>

pkgname="git-clog"
pkgver="0.2.3"
pkgrel="1"
pkgdesc="A tool to colorize the commit graph of a Git repository by interpreting the first six commit hash digits as an RGB color value."
arch=("any")
url="https://github.com/IngoHeimbach/git-clog"
license=("MIT")
depends=("python")
makedepends=("python-setuptools")
source=("https://github.com/IngoHeimbach/git-clog/archive/v${pkgver}.tar.gz")
sha256sums=("5e3e62d704d6aa20a4e6c286b7b7fa3f4218bd7ca5128fcd8b801d26d1be777e")

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
