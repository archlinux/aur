# Maintainer: Matt Pharoah <mtpharoah@gmail.com>
pkgname=parallel-launcher
pkgver=4.6.1
pkgrel=0
epoch=
pkgdesc='A simple easy-to-use launcher for the ParallelN64 and Mupen64Plus-Next emulators'
arch=('x86_64')
url='https://parallel-launcher.ca'
license=('GPL3')
groups=()
depends=(
	'glibc'
	'libstdc++5'
	'gcc-libs'
	'qt5-base'
	'qt5-svg'
	'sdl2'
	'findutils'
	'xdg-utils'
	'flatpak'
	'polkit'
	'sqlite'
	'libgcrypt'
)
makedepends=(
	'gcc'
	'qt5-declarative'
	'make'
	'qt5-tools'
)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install='parallel-launcher.install'
changelog=
source=('parallel-launcher-4.6.1.tar.gz')
noextract=()
md5sums=('7280f1077f21817b0ad94ba2223f2bbd')
validpgpkeys=()

build() {
	qmake-qt5 app.pro -spec linux-g++
	lrelease app.pro
	make
}

package() {
	install -D parallel-launcher $pkgdir/usr/bin/parallel-launcher
	install -D parallel-launcher.desktop $pkgdir/usr/share/applications/parallel-launcher.desktop
	install -D data/appicon.svg $pkgdir/usr/share/parallel-launcher/appicon.svg
	install -D bps-mime.xml $pkgdir/usr/share/parallel-launcher/bps-mime.xml
	install -D lang/parallel-launcher.en_us.qm $pkgdir/usr/share/parallel-launcher/parallel-launcher.en_us.qm
	install -D lang/parallel-launcher.it.qm $pkgdir/usr/share/parallel-launcher/parallel-launcher.it.qm
	install -D lang/parallel-launcher.es.qm $pkgdir/usr/share/parallel-launcher/parallel-launcher.es.qm
	install -D lang/parallel-launcher.eo.qm $pkgdir/usr/share/parallel-launcher/parallel-launcher.eo.qm
	install -D lang/parallel-launcher.fr_ca.qm $pkgdir/usr/share/parallel-launcher/parallel-launcher.fr_ca.qm
	install -D lang/parallel-launcher.fr.qm $pkgdir/usr/share/parallel-launcher/parallel-launcher.fr.qm
	install -D lang/parallel-launcher.de.qm $pkgdir/usr/share/parallel-launcher/parallel-launcher.de.qm
}
