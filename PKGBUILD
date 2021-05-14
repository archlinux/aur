# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Hokuto <abrahamhokuto@outlook.com>

pkgver=3.1.r20.g9e14435
pkgrel=1
epoch=1
pkgname=windows-xp-themes-git
_pkgname=Windows-XP
pkgdesc='All 7 of Windows XP themes available for Linux'
arch=('any')
url='https://github.com/B00merang-Project/WinXP-themes'
license=('GPL')
source=("git+https://github.com/B00merang-Project/Windows-XP.git")
sha256sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd $srcdir/$_pkgname
	mkdir -p $pkgdir/usr/share/themes
	cp -r \
		'Windows XP Embedded' \
		'Windows XP Homestead' \
		'Windows XP Luna' \
		'Windows XP Metallic' \
		'Windows XP Royale Dark' \
		'Windows XP Royale' \
		'Windows XP Zune' \
		$pkgdir/usr/share/themes

	find $pkgdir/usr/ -type f -exec chmod 644 {} \;
	find $pkgdir/usr/ -type d -exec chmod 755 {} \;
}
