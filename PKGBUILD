# Maintainer: Mike Pento <mpento@darkforge.net>

pkgname=gtk-engine-equinox
pkgver=1.50
pkgrel=3
pkgdesc="A heavily modified version of the beautiful Aurora engine"
arch=('x86_64')
url="https://launchpad.net/equinox"
license=('GPL2')
depends=('gtk2')
optdepends=('lib32-gtk-engine-equinox'
	'gtk-theme-equinox')
makedepends=('pkgconfig')
replaces=('gtk-engine-equinox')
source=(https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/gtk2-engines-equinox/$pkgver-0ubuntu4/gtk2-engines-equinox_$pkgver.orig.tar.gz)
sha256sums=('0cf8b8cc841e0da7d4a08ab5a70d3bb330fd76bdcb03165a47aaddcd47e02227')

build() {
	cd $srcdir/equinox-$pkgver
	./configure --prefix=/usr --enable-animation
	make
}

package() {
	cd $srcdir/equinox-1.50
	make DESTDIR="$pkgdir" install
}

