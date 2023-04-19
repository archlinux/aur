# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>

pkgname="py-mailqueued"
pkgver="0.3.0"
pkgrel="1"
pkgdesc="Queueing daemon for msmtp"
arch=("any")
url="https://github.com/dcbaker/py-mailqueued"
license=("GPLv3")
depends=("python" "python-appdirs" "python-attr" "python-gbulb" "python-pydbus")
makedepends=("python-setuptools")
source=("https://github.com/dcbaker/py-mailqueued/archive/${pkgver}.tar.gz")
sha256sums=("5b17223d4569d0ee0c700f7e74dc846d259e0e7377da7faf3022a82f2732c0b9")

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
