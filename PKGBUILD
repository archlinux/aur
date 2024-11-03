# Maintainer: Matt Pharoah <mtpharoah@gmail.com>
pkgname=parallel-launcher
pkgver=7.8.0
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
	'sdl2'
	'polkit'
	'sqlite'
	'libgcrypt'
	'dosfstools'
	'coreutils'
	'p7zip'
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
	'udisks2: mounting emulated SD cards'
)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install='parallel-launcher.install'
changelog=
source=('https://gitlab.com/-/project/22150690/uploads/8eb98987d556b6b8ec7ec34cdfb5555e/parallel-launcher-7.8.0.tar.gz')
noextract=()
sha256sums=('20f6057050d461136a8545f16e89abd7d72ba0eecbb3ddecdd3f37f6d49f578e')
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
	install -D lang/parallel-launcher_en_us.qm $pkgdir/usr/share/parallel-launcher/translations/parallel-launcher_en_us.qm
	install -D lang/parallel-launcher_en_gb.qm $pkgdir/usr/share/parallel-launcher/translations/parallel-launcher_en_gb.qm
	install -D lang/parallel-launcher_it.qm $pkgdir/usr/share/parallel-launcher/translations/parallel-launcher_it.qm
	install -D lang/parallel-launcher_es.qm $pkgdir/usr/share/parallel-launcher/translations/parallel-launcher_es.qm
	install -D lang/parallel-launcher_fr_ca.qm $pkgdir/usr/share/parallel-launcher/translations/parallel-launcher_fr_ca.qm
	install -D lang/parallel-launcher_fr.qm $pkgdir/usr/share/parallel-launcher/translations/parallel-launcher_fr.qm
	install -D lang/parallel-launcher_de.qm $pkgdir/usr/share/parallel-launcher/translations/parallel-launcher_de.qm
	install -D lang/parallel-launcher_ar.qm $pkgdir/usr/share/parallel-launcher/translations/parallel-launcher_ar.qm
	install -D lang/parallel-launcher_pt.qm $pkgdir/usr/share/parallel-launcher/translations/parallel-launcher_pt.qm
	install -D lang/parallel-launcher_ja.qm $pkgdir/usr/share/parallel-launcher/translations/parallel-launcher_ja.qm
	install -D parallel-launcher-sdl-relay $pkgdir/usr/share/parallel-launcher/parallel-launcher-sdl-relay
	install -D parallel-launcher-lsjs $pkgdir/usr/share/parallel-launcher/parallel-launcher-lsjs
}
