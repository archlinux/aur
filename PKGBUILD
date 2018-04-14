# Maintainer: EinBaum <mail@einbaum.org>

pkgrel=1
pkgver=20180414
_commit='30822de84c4ccfbee6ff9955db61bcb02953c264'
sha256sums=('06c30a5d4900b7066ea62a819d3617454e38808b8b96f54038b87775e6959ee8')

pkgname=redmond-themes-git
pkgdesc='Aims to provide the complete Windows experience for easy use on Linux and GNOME-compatible OSes'
arch=('any')
url='https://github.com/B00merang-Project/Redmond-Themes'
license=('GPL')
source=("https://github.com/B00merang-Project/Redmond-Themes/archive/$_commit.zip")

package() {
	cd $srcdir/Redmond-Themes-$_commit
	mkdir -p $pkgdir/usr/share/themes
	cp -r \
		'Windows 3.x' \
		'Windows 8.1' \
		'Windows 9x' \
		'Windows Se7en' \
		'Windows Se7en Basic' \
		'Windows Se7en Blue' \
		'Windows Vista' \
		$pkgdir/usr/share/themes

	find $pkgdir/usr/ -type f -exec chmod 644 {} \;
	find $pkgdir/usr/ -type d -exec chmod 755 {} \;
}
