# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: ValHue <vhuelamo at gmail dot com>
#
pkgname="ojo"
pkgver="0.2.0.r228"
pkgrel="2"
pkgdesc="A fast and good-looking image viewer, nice as a preliminary stage in a \
         photography workflow"
url="http://launchpad.net/~ojo/+archive/ubuntu/daily"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('hicolor-icon-theme' 'python' 'pyexiv2')
makedepends=('desktop-file-utils' 'python-distutils-extra')
optdepends=()
conflicts=('ojo-bzr')
provides=('ojo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/+files/ojo_0.2-0~228~201903042116~ubuntu19.04.1.tar.gz")
sha256sums=('7e2f0d87ffbc9ec2d3714590f6d77e5169889f2a48ee8df353a095d7ae6b9fcf')

build() {
    cd "${pkgname}-0.2"
    python2 setup.py build
}

package() {
    cd "${pkgname}-0.2"
    python2 setup.py install --root="${pkgdir}"
    rm -rf "${pkgdir}/usr/share/doc"
}

# vim: set ts=4 sw=4 et syn=sh ft=sh:
