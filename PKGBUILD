# Maintainer: Michael Kogan <michael.kogan at gmx dot net>

pkgname='wm-switcher-git'
pkgdesc='Simple GUI to switch window managers in Linux with minimal dependencies'
pkgver=r2.5966c4b
pkgrel=1

depends=('python-pyqt4')
optdepends=('metacity: Switch to the Metacity window manager'
				'xfwm4: Switch to the Xfwm window manager'
				'compiz: Switch to the Compiz window manager'
				'openbox: Switch to the Openbox window manager'
				'compton: Use the Comptop compositor')

source=("git+https://github.com/xircon/wm-switcher.git")
md5sums=('SKIP')

arch=('i686' 'x86_64')
url='https://github.com/xircon/wm-switcher'
license=('GPL3')

package() {
	install -d -m755 "$pkgdir/usr/bin"
	install -m 755 "$srcdir/wm-switcher/wm.py" "$pkgdir/usr/bin/wm-switcher"
}

pkgver() {
	cd "wm-switcher"
	printf -- "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
