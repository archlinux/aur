# Maintainer: Pete Alexandrou <pete@ozmartians.com>
pkgname=vidcutter
pkgver=5.5.0
pkgrel=1
pkgdesc='A modern, simple to use, constantly evolving and hella fast MEDIA CUTTER + JOINER w/ frame-accurate SmartCut technology + Qt5, libmpv, FFmpeg and MediaInfo powering the backend.'
arch=('x86_64')
license=('GPL3')
url="https://vidcutter.ozmartians.com"
source=(https://github.com/ozmartian/${pkgname}/archive/${pkgver}.tar.gz)
changelog=changelog
depends=('python-pyqt5' 'mpv' 'ffmpeg' 'mediainfo')
makedepends=('python-setuptools')
install=${pkgname}.install
provides=('vidcutter')
conflicts=('vidcutter-git')
sha256sums=('bf2d91a82e1ad71cd2b391c96d76579ff1d9519885c279b50f2d6a52a6b1df90')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python3 setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python3 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
