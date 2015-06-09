# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs

_pkgname="ojo"
pkgname="${_pkgname}-bzr"
pkgver=r125
pkgrel=1
pkgdesc="A fast and good-looking image viewer"
arch=('i686' 'x86_64')
url="http://launchpad.net/ojo"
license=('GPL3')
depends=('hicolor-icon-theme' 'python2' 'pyexiv2')
makedepends=('bzr' 'desktop-file-utils')
optdepends=()
conflicts=()
provides=('ojo')
install="${pkgname}.install"
source=("${_pkgname}::bzr+http://bazaar.launchpad.net/~peterlevi/ojo/master/")
md5sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    printf "r%s" "$(bzr revno)"
}

build() {
    cd "${_pkgname}"
    python2 setup.py build
}

package() {
    cd "${_pkgname}"
    python2 setup.py install --root="${pkgdir}"
    rm -rf "${pkgdir}/usr/share/doc"
}
