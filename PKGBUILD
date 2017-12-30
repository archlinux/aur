# Maintainer: Markus Schanz <coksnuss@googlemail.com>
pkgname=pacman-boot-backup-hook
pkgver=1.0
pkgrel=1
pkgdesc="Pacman hook that uses rsync to backup the /boot directory prior to upgrades of the linux or systemd package."
arch=('any')
license=('custom:MIT')
changelog=CHANGELOG
depends=('rsync')

source=('LICENSE'
        '50_bootbackup.hook')
md5sums=('ac9ac34b11dd5a53d096a734ab677479'
         'e2a3034dbae1e27ed782c8b44cbd7f72')

package() {
	install -m 0755 -d $pkgdir/usr/share/licenses/$pkgname
	install -m 0755 -d $pkgdir/usr/share/libalpm/hooks

	install -m 0644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname
	install -m 0644 $srcdir/50_bootbackup.hook $pkgdir/usr/share/libalpm/hooks
}
