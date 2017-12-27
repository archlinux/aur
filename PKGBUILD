# Maintainer: Pete Alexandrou <pete@ozmartians.com>
pkgname=vidcutter-git
pkgver=5.5.0
pkgrel=3
pkgdesc='A modern, simple to use, constantly evolving and hella fast MEDIA CUTTER + JOINER w/ frame-accurate SmartCut technology + Qt5, libmpv, FFmpeg and MediaInfo powering the backend.'
arch=('i686' 'x86_64')
license=('GPL3')
url="https://vidcutter.ozmartians.com"
source=(https://github.com/ozmartian/${pkgname%-git}/archive/${pkgver}.tar.gz)
depends=('python-pyqt5' 'mpv' 'ffmpeg' 'mediainfo')
makedepends=('python-setuptools')
install=${pkgname}.install
provides=('vidcutter')
conflicts=('vidcutter')
sha256sums=('SKIP')

# pkgver() {
#     cd "${pkgname%-git}-${pkgver}"
#     git describe --long --all | sed 's/\([^-]*-g\)/r\1/g;s/-/./g;s/heads\///g'
# }

build() {
    cd "${srcdir}/${pkgname%-git}-${pkgver}"
    python3 setup.py build
}

package() {
    cd "${srcdir}/${pkgname%-git}-${pkgver}"
    python3 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
