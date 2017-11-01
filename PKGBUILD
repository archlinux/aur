# Maintainer: Pete Alexandrou <pete@ozmartians.com>
pkgname=vidcutter-git
pkgver=4.5.0
pkgrel=3
pkgdesc="the simplest + fastest video cutter and joiner"
arch=('i686' 'x86_64')
license=('GPL3')
url="http://vidcutter.ozmartians.com"
source=(https://github.com/ozmartian/${pkgname%-git}/archive/${pkgver}.tar.gz)
depends=('python-pyqt5' 'mpv' 'ffmpeg' 'mediainfo' 'python-opengl')
makedepends=('python-setuptools')
install=${pkgname}.install
provides=('vidcutter')
conflicts=('vidcutter')
sha256sums=('SKIP')

# pkgver() {
#     cd "${pkgname%-git}-${pkgver}"
#     git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
# }

build() {
    cd "${srcdir}/${pkgname%-git}-${pkgver}"
    python3 setup.py build
}

package() {
    cd "${srcdir}/${pkgname%-git}-${pkgver}"
    python3 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
