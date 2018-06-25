# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: ValHue <vhuelamo at gmail dot com>
#
pkgname="ojo"
pkgver="0.1.0.r156"
pkgrel="1"
pkgdesc="A fast and good-looking image viewer, nice as a preliminary stage in a \
         photography workflow"
url="http://launchpad.net/~ojo/+archive/ubuntu/daily"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('hicolor-icon-theme' 'python2' 'pyexiv2')
makedepends=('desktop-file-utils' 'python2-distutils-extra')
optdepends=()
conflicts=('ojo-bzr')
provides=('ojo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/+files/ojo_0.1-0~156~201806250516~ubuntu18.04.1.tar.gz")
sha256sums=('81e69f6f5757f7bfc89d40d35d8b4203c6e3bdce3512e1a63e4c207207e3b1b3')

build() {
    cd "${pkgname}-0.1"
    python2 setup.py build
}

package() {
    cd "${pkgname}-0.1"
    python2 setup.py install --root="${pkgdir}"
    rm -rf "${pkgdir}/usr/share/doc"
}

# vim:set ts=4 sw=2 ft=sh et syn=sh ft=sh:
