# Maintainer: Jacob Juric <jacobjuric1@gmail.com>

pkgname='gwinwrap-git'
pkgver=r41.6627153
pkgrel=1
pkgdesc="A simple GTK gui to xwinwrap written in pygtk+glade"
arch=('any')
url="https://github.com/gavintlgold/gwinwrap"
license=('GPL')
depends=('pygtk' 'python' 'shantz-xwinwrap-bzr' 'xscreensaver')
makedepends=('git')
source=('git://github.com/gavintlgold/gwinwrap.git'
        'gwinwrap.bash')
sha256sums=('SKIP'
            'e3adcb7994a39c340ee942b7ef939ac5c275ae80bd56e026dc515c7ef54c4cd0')

pkgver() {
	cd "$srcdir/gwinwrap"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -Dm755 gwinwrap.bash $pkgdir/usr/bin/gwinwrap
	install -Dm755 gwinwrap/gwinwrap.py $pkgdir/usr/share/gwinwrap/gwinwrap.py
	install -Dm755 gwinwrap/gwinwrap.glade $pkgdir/usr/share/gwinwrap/gwinwrap.glade
	install -Dm777 gwinwrap/prefs.gwrp $pkgdir/usr/share/gwinwrap/prefs.gwrp
	install -Dm777 gwinwrap/presets.gwrp $pkgdir/usr/share/gwinwrap/presets.gwrp
}
