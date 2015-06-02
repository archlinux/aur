# Maintainer: Thiago Kenji Okada <thiago DOT mast3r AT gmail DOT com>

pkgname='rutorrent-mobile-git'
pkgver=0.9.r78.gcc47ee8
pkgrel=1
pkgdesc=' Plugin for ruTorrent to use it with mobile devies (Android, iOS, etc)'
arch=('any')
url='https://github.com/xombiemp/rutorrentMobile/'
license=('GPL3')
depends=('rutorrent')
makedepends=('git')
source=('git+https://github.com/xombiemp/rutorrentMobile.git')
sha1sums=('SKIP')

pkgver() {
	cd "${srcdir}/rutorrentMobile"
	git describe --long | sed 's/release//; s/\([^-]*-g\)/r\1/; s/-/./g'
}

package() {
	cd "${srcdir}/rutorrentMobile"
	mkdir -p "${pkgdir}/usr/share/webapps/rutorrent/plugins/mobile"
	cp -r * "${pkgdir}/usr/share/webapps/rutorrent/plugins/mobile"
	cd "${pkgdir}/usr/share/webapps/rutorrent/plugins/mobile"
	rm -rf .git*
}
