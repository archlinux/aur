# Maintainer: Pete Alexandrou <pete@ozmartians.com>
pkgname=vidcutter-git
_pkgname=vidcutter
pkgver=4.5.0.DEV
pkgrel=6
pkgdesc="the simplest + fastest video cutter and joiner"
arch=('i686' 'x86_64')
license=('GPL3')
url="http://vidcutter.ozmartians.com"
source=(https://github.com/ozmartian/${_pkgname}/archive/${pkgver}.tar.gz)
depends=('python-pyqt5' 'mpv' 'ffmpeg' 'mediainfo' 'python-opengl')
makedepends=('python-setuptools')
install=${pkgname}.install
provides=('vidcutter-git')
conflicts=('vidcutter')
sha256sums=('SKIP')

# pkgver() {
#     cd "${_pkgname}-${pkgver}"
#     git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
# }

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python3 setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python3 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
