# Maintainer:  Alex Mekkering <amekkering at gmail dot com>

pkgname=luky-borg-backup

pkgver=1.0.0
pkgrel=1
pkgdesc="Automated backup scripts using Borg Backup, systemd and optionally Nextcloud/ownCloud/Stack"
arch=(any)
license=('MIT')
depends=('borg')
optdepends=('owncloud-client: For backing up to Nextcloud/ownCloud/Stack')
source=('luky-borg-backup' 
        'luky-borg-backup.service'
        'luky-borg-backup.timer'
        'luky-borg-backup.conf'
)
md5sums=('e98689841afd51b0f8572085aa2d1917'
         '1d2f47ca460ab2d477b3753f9a86ae07'
         '5b876c8ae21d8ce159c161993e97536d'
         'b1ef1610ffd6f3dd792da4869910a917')

package() {
    install -D -m 755 "$srcdir/luky-borg-backup" "$pkgdir/usr/bin/luky-borg-backup"
    install -D -m 644 "$srcdir/luky-borg-backup.service" "$pkgdir/usr/lib/systemd/system/luky-borg-backup.service"
    install -D -m 644 "$srcdir/luky-borg-backup.timer" "$pkgdir/usr/lib/systemd/system/luky-borg-backup.timer"
    install -D -m 644 "$srcdir/luky-borg-backup.conf" "$pkgdir/etc/luky-borg-backup.conf"
}
