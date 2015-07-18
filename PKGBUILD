# Maintainer: Robin Thompson <robin*dot*thompson99*at*gmail*dot*com>
_pkgname=dock-applet
pkgname=mate-applet-dock-git
pkgver=0.62.r3.gf4af0cd
pkgrel=1
epoch=
pkgdesc="An application dock applet for the MATE panel"
arch=('any')
url="https://github.com/robint99/dock-applet"
license=('GPLv3')
depends=("mate-panel" "python" "python-xdg" "python-cairo")
makedepends=("git")
install="mate-applet-dock.install"
source=("git+http://github.com/robint99/dock-applet")
md5sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long | sed 's/^V//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/dock-applet"
	./configure --prefix=/usr --disable-schemas-compile
	make
}

package() {
	cd "$srcdir/dock-applet"
	make DESTDIR="$pkgdir/" install
}

