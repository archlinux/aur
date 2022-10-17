# Maintainer: Matt Pharoah <mtpharoah@gmail.com>
pkgname=parallel-launcher
pkgver=6.12.1
pkgrel=0
epoch=
pkgdesc='Modern N64 Emulator'
arch=('x86_64')
url='https://parallel-launcher.ca'
license=('GPL3')
groups=()
depends=(
	'glibc'
	'gcc-libs'
	'qt5-base'
	'qt5-svg'
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
optdepends=(
	'noto-fonts: intended font'
)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install='parallel-launcher.install'
changelog=
source=('https://gitlab.com/parallel-launcher/parallel-launcher/uploads/123bdae376389605fe5819231fb7d7f5/parallel-launcher-6.11.2.tar.gz')
noextract=()
sha256sums=('dff1b0a0119ffb4d456ac5065c81c2f77503718d1c4de68a7992d477df0d831a')
validpgpkeys=()

build() {
	qmake-qt5 app.pro -spec linux-g++
	lrelease app.pro
	make -j `nproc`
}

package() {
	install -D parallel-launcher $pkgdir/usr/bin/parallel-launcher
	install -D ca.parallel_launcher.ParallelLauncher.desktop $pkgdir/usr/share/applications/ca.parallel_launcher.ParallelLauncher.desktop
	install -D ca.parallel_launcher.ParallelLauncher.metainfo.xml $pkgdir/usr/share/metainfo/ca.parallel_launcher.ParallelLauncher.metainfo.xml
	install -D data/appicon.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/ca.parallel_launcher.ParallelLauncher.svg
	install -D bps-mime.xml $pkgdir/usr/share/parallel-launcher/bps-mime.xml
	install -D lang/parallel-launcher.en_us.qm $pkgdir/usr/share/parallel-launcher/parallel-launcher.en_us.qm
	install -D lang/parallel-launcher.en_gb.qm $pkgdir/usr/share/parallel-launcher/parallel-launcher.en_gb.qm
	install -D lang/parallel-launcher.it.qm $pkgdir/usr/share/parallel-launcher/parallel-launcher.it.qm
	install -D lang/parallel-launcher.es.qm $pkgdir/usr/share/parallel-launcher/parallel-launcher.es.qm
	install -D lang/parallel-launcher.fr_ca.qm $pkgdir/usr/share/parallel-launcher/parallel-launcher.fr_ca.qm
	install -D lang/parallel-launcher.fr.qm $pkgdir/usr/share/parallel-launcher/parallel-launcher.fr.qm
	install -D lang/parallel-launcher.de.qm $pkgdir/usr/share/parallel-launcher/parallel-launcher.de.qm
	install -D lang/parallel-launcher.ar.qm $pkgdir/usr/share/parallel-launcher/parallel-launcher.ar.qm
}
