# Maintainer: Pete Alexandrou <pete@ozmartians.com>
pkgname=vidcutter
pkgver=5.0.0
pkgrel=1
pkgdesc="the simplest + fastest video cutter and joiner"
arch=('i686' 'x86_64')
license=('GPL3')
url="https://vidcutter.ozmartians.com"
source=(https://github.com/ozmartian/${pkgname}/archive/${pkgver}.tar.gz)
changelog=changelog
depends=('python-pyqt5' 'mpv' 'ffmpeg' 'mediainfo' 'python-opengl')
makedepends=('python-setuptools')
install=${pkgname}.install
provides=('vidcutter')
conflicts=('vidcutter-git')
sha256sums=('651177b002284752225b67c8368835723ab569f253df76ea4cb1add61cbd3e8a')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python3 setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python3 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
