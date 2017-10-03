# Maintainer:  Alex Mekkering <amekkering at gmail dot com>

pkgname=luky-borg-backup

pkgver=1.0.2
pkgrel=1
pkgdesc="Automated backup scripts using Borg Backup, systemd and optionally Nextcloud/ownCloud/Stack"
arch=(any)
license=("GPL3")
url="https://github.com/AlexMekkering/luky-borg-backup"
depends=("borg")
optdepends=("owncloud-client: For backing up to Nextcloud/ownCloud/Stack"
            "systemd-unit-status-mail: For mailing the backup unit's status")
source=("https://github.com/AlexMekkering/luky-borg-backup/archive/v${pkgver}.tar.gz")
backup=("etc/luky-borg-backup.conf")
sha256sums=('eefdb668ee4fa08f94fca9bcc2227c2a9e3b518dcb735bf2c25d7af66cf293ed')

package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    install -D -m 755 "luky-borg-backup" "$pkgdir/usr/bin/luky-borg-backup"
    install -D -m 644 "luky-borg-backup.service" "$pkgdir/usr/lib/systemd/system/luky-borg-backup.service"
    install -D -m 644 "luky-borg-backup.timer" "$pkgdir/usr/lib/systemd/system/luky-borg-backup.timer"
    install -D -m 600 "luky-borg-backup.conf" "$pkgdir/etc/luky-borg-backup.conf"
}
