# Maintainer:  AliReza AmirSamimi <alireza.amirsamimi at gmail dot com>
# Co-Maintainer: M A <morealaz at gmail dot com>

pkgname='persepolis'
pkgver=3.2.0
pkgrel=4
pkgdesc="A graphical front-end for aria2 download manager with lots of features."
arch=('any')
url="https://persepolisdm.github.io/"
license=('GPL3')
depends=('aria2' 'libnotify' 'libpulse' 'python' 'python-psutil' 'python-pyqt5' 'python-requests' 'python-setproctitle' 'qt5-svg' 'sound-theme-freedesktop' 'youtube-dl' 'ffmpeg')
makedepends=('python-setuptools')
optdepends=('adwaita-qt: for using adwaita style in GTK based Desktops.')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/persepolisdm/persepolis/archive/${pkgver}.tar.gz")
sha256sums=('d27cf2a4e02b0fbe79b1903ca0ab32a6007493d51a8201443a8febb566750acd')

prepare() {
    cd "${pkgname}-${pkgver}"
    gzip -k -9 ./man/persepolis.1
}

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
}
# vim:set ts=4 sw=4 et:
