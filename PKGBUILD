# Maintainer: Jason Graves <j.graves@collaboradev.com>

pkgname=xfce4-finder
pkgver=1.0.0
pkgrel=1
pkgdesc="Smart and intuitive application finder, complete with theme and customization support."
arch=('any')
url='https://github.com/godlikemouse/xfce4-finder'
license=('MIT')
groups=('xfce4')
depends=('glib2' 'gtkmm3' 'garcon' 'xfconf' 'libxfce4util' 'libxfce4ui')
makedepends=('automake' 'autoconf' 'xfce4-dev-tools' 'git')
source=("git+https://github.com/godlikemouse/$pkgname.git")
md5sums=('SKIP')

build() {
	cd "$srcdir/$pkgname"
	./autogen.sh
	./configure
	make
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/" install
}
