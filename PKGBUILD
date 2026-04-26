# Maintainer: Matt Pharoah <mtpharoah@gmail.com>
pkgname=parallel-launcher
pkgver=9.0.4
pkgrel=1
epoch=
pkgdesc='Modern N64 Emulator'
arch=('x86_64')
url='https://parallel-launcher.ca'
license=('GPL3')
groups=()
depends=(
	'glibc'
	'gcc-libs'
	'qt6-base'
	'qt6-svg'
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
	'zlib'
)
makedepends=(
	'gcc'
	'qt6-declarative'
	'make'
	'qt6-tools'
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
source=('https://gitlab.com/-/project/22150690/uploads/fe2c8f388f59b95439b8e4723c2c1685/parallel-launcher-9.0.4.tar.gz')
noextract=()
sha256sums=('e3f76f7c743049376c7d43e3bb3b0c0e800bb2a23a3e3907ee7b8bbd58982b36')
validpgpkeys=()

build() {
	qmake6 app.pro -spec linux-g++
	/usr/lib/qt6/bin/lrelease app.pro
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
