# Maintainer: Neboer <rubinposter@gmail.com>
pkgname=s3-syncer
pkgver=0.1
pkgrel=1
pkgdesc="Periodic rclone-based S3 mirror syncer with systemd integration"
arch=('any')
license=('MIT')
depends=('rclone')
install=
source=('s3-syncer.sh'
        's3-syncer.service'
        's3-syncer.timer'
        'config.env'
        'rclone.conf')
backup=('etc/s3-syncer/config.env'
        'etc/s3-syncer/rclone.conf')
sha256sums=('20d06058693d55af45e966b4a511f4a4d49ef4bf84cb29d4bbad7469b9e3929b'
            'ddc6dbaa01322c0b4a6c67661a6409271fae80dd9a37df374bd502dc3628e3e2'
            '9eb497b6563e8a367b590bfe8c12ec71558ef94e2a1295da6ad1539c8f3e275f'
            '86829fc712ba186e566a9200c4e045bce26f00f4f4f216ad701a3f1648bae439'
            '794cdb953eaccbdf4012045ca623700abdf60ed6ee7d3d4b4c4e2db0cc57f205')

package() {
    install -Dm755 "$srcdir/s3-syncer.sh" "$pkgdir/usr/bin/s3-syncer"
    install -Dm644 "$srcdir/config.env" "$pkgdir/etc/s3-syncer/config.env"
    install -Dm644 "$srcdir/rclone.conf" "$pkgdir/etc/s3-syncer/rclone.conf"
    install -Dm644 "$srcdir/s3-syncer.service" "$pkgdir/usr/lib/systemd/system/s3-syncer.service"
    install -Dm644 "$srcdir/s3-syncer.timer" "$pkgdir/usr/lib/systemd/system/s3-syncer.timer"
}
