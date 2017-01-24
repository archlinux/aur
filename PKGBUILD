# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=gnome-shell-extension-radio-git
pkgver=1.4.r25.gd6d6eb3
pkgrel=1
pkgdesc="Gnome shell extension for listening to internet radio streams."
arch=(any)
url="https://github.com/hslbck/gnome-shell-extension-radio"
license=('GPL')
depends=('gnome-shell>=3.18' 'gst-plugins-bad' 'gst-plugins-bad' 'gst-plugins-bad' 'gst-plugins-bad')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=gnome-shell.install
source=("${pkgname%-git}::git+https://github.com/hslbck/gnome-shell-extension-radio.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${pkgname%-git}"	
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
