# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname='persepolis'
pkgver=3.0.1
pkgrel=1
pkgdesc="A graphical front-end for aria2 download manager with lots of features."
arch=('any')
url="https://persepolisdm.github.io/"
license=('GPL3')
depends=('aria2' 'libnotify' 'python' 'python-psutil' 'python-pyqt5' 'python-requests' 'python-setproctitle' 'qt5-svg' 'sound-theme-freedesktop')
makedepends=('python-setuptools')
optdepends=('firefox-flashgot: for integrating with firefox.')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/persepolisdm/persepolis/archive/${pkgver}.tar.gz")
sha256sums=('ae62fc85bae528d11e57b094d6cb8c229f572f4ec5de30c0c51f1897f8fe9774')

prepare() {
    cd "${pkgname}-${pkgver}"
    gzip -k -9 ./man/persepolis.1
}

package() {
	cd "${pkgname}-${pkgver}"
	python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
}
# vim:set ts=2 sw=2 et:
