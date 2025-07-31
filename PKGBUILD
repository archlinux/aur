# Maintainer: Neboer <rubinposter@gmail.com>
pkgname=s3-syncer
pkgver=0.2
pkgrel=2
pkgdesc="Periodic rclone-based S3 mirror syncer with systemd integration"
arch=('any')
license=('MIT')
depends=('rclone')
install=
source=('s3-syncer.sh'
        's3-syncer.service'
        's3-syncer.timer'
        's3-syncer.sysusers'
        'config.env'
        'rclone.conf')
backup=('etc/s3-syncer/config.env'
        'etc/s3-syncer/rclone.conf')
sha256sums=('75f60e7fe764da8b68d69f7ddd3a21e1f58d7f62fcac956ecddfe8175b77b538'
            'a02530d14c2c3e00f86c8185df9d7f22c92605054bd119c02b76308f2174c88b'
            '9eb497b6563e8a367b590bfe8c12ec71558ef94e2a1295da6ad1539c8f3e275f'
            'a549b0000d3c39035c86a521464764990a19a7052c17f39e0a27e64402cd6182'
            '02a9d105bf25f6b956224da89ec828ba2befdb95c2a6ac0eea831429a43ca084'
            '794cdb953eaccbdf4012045ca623700abdf60ed6ee7d3d4b4c4e2db0cc57f205')

package() {
    install -Dm755 "$srcdir/s3-syncer.sh" "$pkgdir/usr/bin/s3-syncer"
    install -Dm644 "$srcdir/config.env" "$pkgdir/etc/s3-syncer/config.env"
    install -Dm644 "$srcdir/rclone.conf" "$pkgdir/etc/s3-syncer/rclone.conf"
    install -Dm644 "$srcdir/s3-syncer.sysusers" "$pkgdir/usr/lib/sysusers.d/s3-syncer.conf"
    install -Dm644 "$srcdir/s3-syncer.service" "$pkgdir/usr/lib/systemd/system/s3-syncer.service"
    install -Dm644 "$srcdir/s3-syncer.timer" "$pkgdir/usr/lib/systemd/system/s3-syncer.timer"
}
