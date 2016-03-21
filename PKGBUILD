# PKGBUILD file for General-purpose Photovoltaic Device Model - gpvdm gpvdm.com

# Maintainer: Roderick MacKenzie <roderick dot mackenzie at nottingham dot ac dot uk>
pkgname=gpvdm
pkgver=4.40
pkgrel=1
epoch=
pkgdesc="A numerical device model for the simulation of solar cells and OLEDs."
arch=('i686' 'x86_64')
url="http://www.gpvdm.com"
license=('GPL')
groups=()
depends=('python2-oslo-i18n'
'python2-numpy'
'python2-matplotlib'
'pywebkitgtk'
'python2-dbus'
'python2-notify'
'umfpack'
'libzip'
'gsl'
)

makedepends=()

checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=gpvdm.install
changelog=
source=(http://gpvdm.com/download_src/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=()
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
	#patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
}

build() {
	cd "$pkgname-$pkgver"
	#./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	#make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" DEST_LIB=lib install
}


md5sums=('925549c4252a994022dd3d4aed8ff869')
