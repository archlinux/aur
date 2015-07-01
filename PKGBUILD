# Maintainer: Alain Kalker <a {dot} c {dot} kalker "at" gmail {dot} com>
pkgname=xweston-git
pkgver=0.7.1.r0.gf9d9003
pkgrel=1
pkgdesc="Use X display managers and window managers with Xwayland and weston"
arch=('any')
url="https://github.com/ackalker/Xweston"
license=('GPL')
depends=('weston' 'xorg-server-xwayland')
makedepends=('git')
provides=('xweston')
conflicts=('xweston')
source=(git://github.com/ackalker/Xweston)
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/Xweston"
	git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
	cd "$srcdir/Xweston"
	make DESTDIR="$pkgdir" PREFIX=/usr install
}
