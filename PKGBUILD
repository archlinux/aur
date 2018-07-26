# Maintainer: Fabien Dubosson <fabien.dubosson@gmail.com>

pkgname="python-pyinsane2"
_pkgname="pyinsane"
pkgver="2.0.13"
pkgrel="1"
pkgdesc="Python implementation of the Sane API (using ctypes) and abstration layer"
arch=('any')
url="https://gitlab.gnome.org/World/OpenPaperwork/pyinsane"
license=('GPL3')
makedepends=('python' 'python-setuptools' 'git')
depends=('python' 'python-pillow' 'sane')
changelog="ChangeLog"
source=("git+https://gitlab.gnome.org/World/OpenPaperwork/${_pkgname}#tag=${pkgver}")
md5sums=('SKIP')

build() {
    cd ${srcdir}/${_pkgname}
    make build
}

package() {
    cd ${srcdir}/${_pkgname}
    PIP_ARGS="--root=\"${pkgdir}\" --optimize=1" make install
}
