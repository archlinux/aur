# Contributor: Connor Behan <connor.behan@gmail.com>

pkgname=xfce4-generic-slider-git
pkgver=32.82e814f
pkgrel=1
pkgdesc="Xfce panel plugin for adjusting the value passed to a command"
arch=(i686 x86_64)
license=('GPL')
url="http://goodies.xfce.org/projects/panel-plugins/xfce4-generic-slider"
groups=('xfce4-goodies')
depends=('xfce4-panel')
makedepends=('xfce4-dev-tools')
source=('git+https://gitlab.xfce.org/panel-plugins/xfce4-generic-slider')

pkgver() {
	cd "$srcdir"/xfce4-generic-slider
	echo `git rev-list --count master`.`git rev-parse --short master`
}

build() {
	cd "$srcdir"/xfce4-generic-slider
	./autogen.sh --prefix=/usr
	make
}

package() {
	cd "$srcdir"/xfce4-generic-slider
	make DESTDIR="$pkgdir" install
}

sha256sums=('SKIP')
