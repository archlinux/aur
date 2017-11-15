# Maintainer: Pete Alexandrou <pete@ozmartians.com>
pkgname=vidcutter
pkgver=5.0.0
pkgrel=2
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
sha256sums=('4d114eb5050029294a7659b186907061c0f60ec268da6e7738cf7e8cfec9cc4c')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python3 setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python3 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
