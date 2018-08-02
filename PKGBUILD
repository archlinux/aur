# Maintainer: Pete Alexandrou <pete@ozmartians.com>
pkgname=vidcutter
pkgver=6.0.0
pkgrel=1
pkgdesc='A modern, simple to use, constantly evolving and hella fast MEDIA CUTTER + JOINER w/ frame-accurate SmartCut technology + Qt5, libmpv, FFmpeg and MediaInfo powering the backend.'
arch=('x86_64')
license=('GPL3')
url="https://vidcutter.ozmartians.com"
source=(https://github.com/ozmartian/${pkgname}/archive/${pkgver}.tar.gz)
changelog=changelog
depends=('ffmpeg' 'mediainfo' 'mpv' 'python-opengl' 'python-pyqt5' 'python-setuptools' 'python-simplejson')
makedepends=('python-setuptools')
install=${pkgname}.install
provides=('vidcutter')
conflicts=('vidcutter-git')
sha256sums=('67a420f8698b92a230257c50bcd0eecd562b6577c0dba738fc5e4b4ef7b8f87e')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python3 setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python3 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
