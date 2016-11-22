# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname='persepolis'
pkgver=2.2.2_unstable
pkgrel=2
pkgdesc="A graphical front-end for aria2 download manager with lots of features."
arch=('any')
url="https://persepolisdm.github.io/"
license=('GPL3')
depends=('aria2' 'vorbis-tools' 'libnotify' 'python' 'python-pyqt5' 'qt5-svg')
optdepends=('firefox-flashgot: for integrating with firefox.')
provides=("${pkgname}" "persepolis")
conflicts=("${pkgname}" "persepolis")
source=("${pkgname}.tar.gz::https://github.com/persepolisdm/persepolis/archive/${pkgver}.tar.gz")
md5sums=('048ce74b8f8e4d0ef00ebe909f9f55cc')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -d ${pkgdir}/usr/{bin,share/{persepolis,pixmaps,applications,licenses/persepolis}}
	install -d ${pkgdir}/usr/share/man/man1
	cp -a ./files/*   ${pkgdir}/usr/share/persepolis
	install -Dm755 ./persepolis ${pkgdir}/usr/bin/persepolis
	install -Dm644 ./Persepolis\ Download\ Manager.desktop ${pkgdir}/usr/share/applications/persepolis.desktop
	install -Dm644 ./persepolis.1.gz ${pkgdir}/usr/share/man/man1/persepolis.1.gz
	cp ./files/icon.svg ${pkgdir}/usr/share/pixmaps/persepolis.svg
	cp ./LICENSE ${pkgdir}/usr/share/licenses/persepolis/
}
