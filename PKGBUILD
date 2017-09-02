# Maintainer: Michael Kogan <michael.kogan at gmx dot net>

pkgname='wm-switcher'
pkgdesc='Simple GUI to switch window managers in Linux with minimal dependencies'
pkgver=1.04
pkgrel=1

depends=('python-pyqt5')
optdepends=('metacity: Switch to the Metacity window manager'
		'xfwm4: Switch to the Xfwm window manager'
		'compiz: Switch to the Compiz window manager'
		'openbox: Switch to the Openbox window manager'
		'compton: Use the Compton compositor')

source=("https://github.com/xircon/wm-switcher/archive/v$pkgver.tar.gz")
md5sums=('21cb1098542637afe9e8894ebff9373d')

arch=('i686' 'x86_64')
url='https://github.com/xircon/wm-switcher'
license=('GPL3')

package() {
	install -d -m755 "$pkgdir/usr/bin"
	install -d -m755 "$pkgdir/usr/share/applications"
	install -d -m755 "$pkgdir/usr/share/doc/wm-switcher"
	install -m 755 "$srcdir/wm-switcher-$pkgver/wm-switcher" "$pkgdir/usr/bin/wm-switcher"
	cp -dr "$srcdir/wm-switcher-$pkgver/wm-switcher.desktop" "$pkgdir/usr/share/applications/"
	cp -dr "$srcdir/wm-switcher-$pkgver/LICENSE" "$pkgdir/usr/share/doc/wm-switcher/"
	cp -dr "$srcdir/wm-switcher-$pkgver/README.md" "$pkgdir/usr/share/doc/wm-switcher/"
}
