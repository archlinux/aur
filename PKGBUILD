# Maintainer: X0rg
# Contributor: u8sand (https://gist.github.com/u8sand/c2ed7dfbf6e4e781f532daf5aab141cb)

pkgname='pacman-mirrorlist-rankmirrors-hook'
pkgver=1
pkgrel=1
pkgdesc='Pacman hook to automatically rank new mirrors'
arch=('any')
depends=('pacman-contrib' 'pacman-mirrorlist')
backup=(etc/pacman.d/mirrorlist-rankmirrors.conf)
install=$pkgname.install
source=('rank-mirror-list'
	'mirrorlist-rankmirrors.conf'
	'pacman-mirrorlist.hook')
sha512sums=('3d9601e39dd8f519a007577404f0ede064b5471ca21adb99f4aabf52e51abb044c9c0173d9fe6808b0ac26380e29cdb44164014b19526e19d6d634602f3ab100'
            '1ed343d832ef68e4ca839a73e0bb2abd13f95e13aab18398c1fe13450f46315686e40634c3c7dddfeed8eb83e1ca5d48c60c9f0615ab58a51005c753b945ae58'
            'cad293a8e665dcd5af332c62ed45bd1f2290925c8395dd938a822749c0bb7e8e5083a35ed21aa664d65885c184149eae4d42297719295d3151dc6ead85f5b651')

package() {
	install -Dvm755 "$srcdir/rank-mirror-list"            "$pkgdir/usr/bin/rank-mirror-list"
	install -Dvm644 "$srcdir/mirrorlist-rankmirrors.conf" "$pkgdir/etc/pacman.d/mirrorlist-rankmirrors.conf"
	install -Dvm644 "$srcdir/pacman-mirrorlist.hook"     "$pkgdir/usr/share/libalpm/hooks/pacman-mirrorlist.hook"
}
