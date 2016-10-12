# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs
#
pkgname="ojo"
pkgver="0.1.0.r134"
pkgrel="2"
pkgdesc="A fast and good-looking image viewer"
arch=('i686' 'x86_64')
url="http://launchpad.net/~ojo"
license=('GPL3')
depends=('hicolor-icon-theme' 'python2' 'pyexiv2')
makedepends=('desktop-file-utils' 'python2-distutils-extra')
optdepends=()
conflicts=('ojo-bzr')
provides=('ojo')
source=("https://launchpad.net/~ojo/+archive/ubuntu/daily/+files/ojo_0.1-0~134~201608081617~ubuntu16.10.1.tar.gz")
sha256sums=('42ada6df33eaaefc6f1ccadda113c769ce68ba01766cc65f60fe7d2b6680f845')

build() {
    cd "${pkgname}-0.1"
    python2 setup.py build
}

package() {
    cd "${pkgname}-0.1"
    python2 setup.py install --root="${pkgdir}"
    rm -rf "${pkgdir}/usr/share/doc"
}

# vim:set ts=4 sw=2 ft=sh et:
