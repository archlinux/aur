# Maintainer: Pete Alexandrou <pete@ozmartians.com>
pkgname=vidcutter-git
pkgver=5.0.0.r0.gd3b05ba
_pkgver=master
pkgrel=1
pkgdesc="the simplest + fastest video cutter and joiner"
arch=('i686' 'x86_64')
license=('GPL3')
url="http://vidcutter.ozmartians.com"
source=(https://github.com/ozmartian/${pkgname%-git}/archive/${_pkgver}.tar.gz)
depends=('python-pyqt5' 'mpv' 'ffmpeg' 'mediainfo' 'python-opengl')
makedepends=('python-setuptools')
install=${pkgname}.install
provides=('vidcutter')
conflicts=('vidcutter')
sha256sums=('SKIP')

# pkgver() {
#     cd "${pkgname%-git}-${_pkgver}"
#     git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
# }

build() {
    cd "${srcdir}/${pkgname%-git}-${_pkgver}"
    python3 setup.py build
}

package() {
    cd "${srcdir}/${pkgname%-git}-${_pkgver}"
    python3 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
