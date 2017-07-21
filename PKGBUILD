# Maintainer:  Alex Mekkering <amekkering at gmail dot com>

pkgname=luky-borg-backup

pkgver=1.0.0
pkgrel=2
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
backup=('etc/luky-borg-backup.conf')
sha256sums=('4410d6f2938d47373f2877f08421ceb69faf302782056cf1c7dcb2290d8c606e'
            'a90e9e739cf4adc98ee394e87c7ead7d365783ca321e3b47e6782e69c5638b07'
            '188463a3644df0e70e030d0236b6ef04446cd5064a50a7307f1792c3645e31bd'
            '7245e87ab2516d808158dab177c07247e2c61d5d8c41d61cac4143182c1a6a58')

package() {
    install -D -m 755 "$srcdir/luky-borg-backup" "$pkgdir/usr/bin/luky-borg-backup"
    install -D -m 644 "$srcdir/luky-borg-backup.service" "$pkgdir/usr/lib/systemd/system/luky-borg-backup.service"
    install -D -m 644 "$srcdir/luky-borg-backup.timer" "$pkgdir/usr/lib/systemd/system/luky-borg-backup.timer"
    install -D -m 600 "$srcdir/luky-borg-backup.conf" "$pkgdir/etc/luky-borg-backup.conf"
}
