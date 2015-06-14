pkgname=fundamental-theme
pkgver=20100102
pkgrel=1
pkgdesc="Fundamental BMPanel2/GTK+2.0/Openbox3/PekWM/XFWM4 Theme"
arch=('any')
url="http://weakhead.deviantart.com/art/Fundamental-148956109"
license=('GPL')
depends=('gtk-engines' 'gtk-engine-murrine>=0.98.0')
optdepends=('bmpanel2: BMPanel2 theme'
            'openbox:  Openbox theme'
            'pekwm:    PekWM theme'
            'xfwm4:    XFWM4 theme')
source=("http://orig00.deviantart.net/1690/f/2010/002/8/8/fundamental_by_weakhead.zip")
md5sums=('2a6db561c63c00149a75e2c890102174')

prepare() {
	cd Fundamental

	# Purge backup files
	find . -type f -name '*~' -print0 | xargs -0r rm
}

package() {
	cd Fundamental

	# BMPanel2 Theme
	mkdir -p "$pkgdir"/usr/share/bmpanel2/themes
	cp -a BMPanel2/Fundamental "$pkgdir"/usr/share/bmpanel2/themes

	# GTK+2.0/Openbox3/XFWM4 Themes
	mkdir -p "$pkgdir"/usr/share/themes
	cp -a GTK/Fundamental "$pkgdir"/usr/share/themes

	# PekWM Theme
	mkdir -p "$pkgdir"/usr/share/pekwm/themes
	cp -a PekWM/Fundamental "$pkgdir/"usr/share/pekwm/themes
}

# vim: set ft=sh ts=4 sw=4 noet:
