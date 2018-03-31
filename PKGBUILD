# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname='persepolis'
pkgver=3.1.0
pkgrel=2
pkgdesc="A graphical front-end for aria2 download manager with lots of features."
arch=('any')
url="https://persepolisdm.github.io/"
license=('GPL3')
depends=('aria2' 'libnotify' 'libpulse' 'python' 'python-psutil' 'python-pyqt5' 'python-requests' 'python-setproctitle' 'qt5-svg' 'sound-theme-freedesktop' 'youtube-dl')
makedepends=('python-setuptools')
optdepends=('adwaita-qt5: for using adwaita style in GTK based Desktops.')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/persepolisdm/persepolis/archive/${pkgver}.tar.gz")
sha256sums=('7846886604b7e3b1c3acf8ada3ae0d12ab0bddb0914fdc6200167c59a7a16533')

prepare() {
    cd "${pkgname}-${pkgver}"
    gzip -k -9 ./man/persepolis.1
}

package() {
	cd "${pkgname}-${pkgver}"
	python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
}
# vim:set ts=2 sw=2 et:
