# Maintainer: Marius Orcsik <marius@littr.me>
pkgname=mpris-ctl
pkgver=0.9.95
pkgrel=3
pkgdesc="Control any music player that follows the MPRIS specification from the command line"
arch=('x86' 'x86_64')
url="https://git.sr.ht/~mariusor/mpris-ctl"
license=('MIT')
makedepends=('dbus' 'scdoc')
depends=('dbus')
source=("https://git.sr.ht/~mariusor/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('2c06e4e1ce82a454f0b60ef3e5f3ab4026476b578627bf52faaace23c36a6faf')
validpgpkeys=('2AEC637FA54CA7A0EBB1F2F170BC3F8784FBD057')

build() {
	cd "${pkgname}-v${pkgver}"
	make VERSION="${pkgver}-${pkgrel}" release
}

package() {
	cd "${pkgname}-v${pkgver}"
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/share/man/man1"
	make DESTDIR="${pkgdir}/" INSTALL_PREFIX="usr" install
}
