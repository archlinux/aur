# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=kodi-addon-screensaver-appletv4
_pkgname=screensaver.atv4
pkgver=r26.d59f47d
pkgrel=1
pkgdesc="Apple TV4 screensaver for Kodi"
arch=('i686' 'x86_64')
url='https://github.com/enen92/screensaver.atv4'
license=('GPL')
depends=('kodi')
makedepends=('git')
source=("git://github.com/enen92/screensaver.atv4")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -dm755 "$pkgdir/usr/share/kodi/addons"
	install -dm755 "$pkgdir/usr/share/licenses/$_pkgname"
	cp -a "$srcdir/$_pkgname" "$pkgdir/usr/share/kodi/addons/$_pkgname"
	
	# clean up
	rm -rf "$pkgdir/usr/share/kodi/addons/$_pkgname/.git"
	rm -f "$pkgdir/usr/share/kodi/addons/$_pkgname/resources/.DS_Store"
	rm -f "$pkgdir/usr/share/kodi/addons/$_pkgname/changelog.txt"
	mv "$pkgdir/usr/share/kodi/addons/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname"
}
	



