# Maintainer: Pete Alexandrou <pete@ozmartians.com>
pkgname=vidcutter
pkgver=6.0.0
pkgrel=3
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
sha256sums=('c09be7eceaf42ff7211fe3b8125279c4fec7f7d251d272b61d579e426bd4e2c2')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python3 setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python3 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
