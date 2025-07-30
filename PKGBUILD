# Maintainer: Matt Pharoah <mtpharoah@gmail.com>
pkgname=parallel-launcher
pkgver=8.3.0
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
	'fuse'
	'noto-fonts'
	'udisks2'
)
makedepends=(
	'gcc'
	'qt5-declarative'
	'make'
	'qt5-tools'
)
checkdepends=()
optdepends=('noto-fonts-cjk')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install='parallel-launcher.install'
changelog='parallel-launcher.changelog'
source=('https://gitlab.com/-/project/22150690/uploads/2e76ba01343c58efd076346d0970aac5/parallel-launcher-8.3.0.tar.gz')
noextract=()
sha256sums=('a16b5d8accfbc4320bc0aed1b40d4d4c75bd0a1c13f2950896451f6b6a6ed4a9')
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
