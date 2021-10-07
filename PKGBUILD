# Maintainer: Christian Brassat <christian.brassat@gmail.com>
# Contributor: Mark Wagie <mark.wagie@tutanota.com>

pkgname=skeuos-gtk-theme-git
_pkgname=skeuos-gtk
pkgrel=1
pkgver=20211006.r0.gcc944ac
pkgdesc="Light and dark colorful Gtk3.20+ theme"
url='https://github.com/daniruiz/skeuos-gtk'
arch=('any')
license=('GPL3')
makedepends=('git')
source=(git+https://github.com/daniruiz/${_pkgname}.git)
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	# cd "$srcdir/$_pkgname"
	# make DESTDIR="$pkgdir" install

	mkdir -p "$pkgdir"/usr/share/themes

	for shade in Dark Light; do
		for color in Black Blue Brown Cyan Green Grey Magenta Orange Red Teal Violet White Yellow; do
			cp -r $srcdir/$_pkgname/themes/Skeuos-${color}-${shade} "$pkgdir"/usr/share/themes/Skeuos-${color}-${shade}
			cp -r $srcdir/$_pkgname/themes/Skeuos-${color}-${shade}-GNOME_40+41/gnome-shell "$pkgdir"/usr/share/themes/Skeuos-${color}-${shade}
			cp -r $srcdir/$_pkgname/themes/Skeuos-${color}-${shade}-FullPanel-GNOME_40+41 "$pkgdir"/usr/share/themes/Skeuos-${color}-${shade}-FullPanel
		done
	done
}
