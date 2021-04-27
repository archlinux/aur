# Maintainer: Matt Pharoah <mtpharoah@gmail.com>
pkgname=parallel-launcher
pkgver=2.10.0
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
)
makedepends=(
	'gcc'
	'qt5-declarative'
	'make'
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
source=('parallel-launcher-2.10.0.tar.gz')
noextract=()
md5sums=('ac8243412bd4d7c5af0ebf163424a8d9')
validpgpkeys=()

build() {
	qmake-qt5 app.pro -spec linux-g++
	make
}

package() {
	install -D parallel-launcher $pkgdir/usr/bin/parallel-launcher
	install -D parallel-launcher.desktop $pkgdir/usr/share/applications/parallel-launcher.desktop
	install -D data/appicon.svg $pkgdir/usr/share/parallel-launcher/appicon.svg
	install -D bps-mime.xml $pkgdir/usr/share/parallel-launcher/bps-mime.xml
}
