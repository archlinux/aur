# Contributor: Asa Marco <marcoasa90[at]gmail[.]com>

pkgname=openshot
pkgver=1.1.3
pkgrel=1
pkgdesc="an open-source, non-linear video editor for Linux based on MLT framework"
arch=('any')
url="http://www.openshotvideo.com/"
license=('GPL')
depends=('mlt-python-bindings' 'pygoocanvas' 'sdl' 'librsvg' 'pyxdg')
optdepends=('dvgrab: for IEEE digital sources'
	    'libquicktime' 'libavc1394' 'faac' 'jack' 'jack-rack' 'ladspa')
install=openshot.install
source=(http://launchpad.net/openshot/1.1/$pkgver/+download/$pkgname-$pkgver.tar.gz)
md5sums=('2c6285d2aa6356a90da48b9944a0174c')

build() {
	mkdir -p $pkgdir/usr/share/openshot/
	cd $srcdir/$pkgname-$pkgver
	install -Dm644 bin/openshot $pkgdir/usr/bin/openshot
	install -Dm644 xdg/openshot.png $pkgdir/usr/share/pixmaps/openshot.png
	install -Dm644 xdg/openshot.desktop $pkgdir/usr/share/applications/openshot.desktop
	install -Dm644 xdg/openshot.xml $pkgdir/usr/share/mime/packages/openshot.xml
	install -Dm644 xdg/openshot $pkgdir/usr/lib/mime/packages/openshot
	install -Dm644 docs/openshot.1 $pkgdir/usr/share/man/man1
	cp -r  openshot/* $pkgdir/usr/share/openshot/
	chmod +x $pkgdir/usr/bin/openshot
}
