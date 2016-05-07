# Maintainer: fs4000 <matthias_dienstbier[at]yahoo[dot]de>

pkgname=pk-update-icon
pkgver=2
pkgrel=1
pkgdesc="Displays an update-notification tray icon"
arch=('i686' 'x86_64')
url="https://code.guido-berhoerster.org/projects/$pkgname"
license=('GPL')
depends=('libnotify' 'libunique' 'packagekit')
makedepends=('intltool')
optdepends=('gnome-packagekit')
source=("$url/downloads/$pkgname-$pkgver.tar.gz")
sha256sums=('dbd89b77ee25bfa4ffdbc1c7d1c3d7fe818bb02e509cb6c13ce9b8a34ba41dac')

build() {
	cd $pkgname-$pkgver
	make prefix=/usr
}

package() {
	cd $pkgname-$pkgver
	make DESTDIR="$pkgdir" prefix=/usr install
}
