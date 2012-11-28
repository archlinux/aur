# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Author: ody

pkgname=pacman-cage
pkgver=2.9.9
pkgrel=5
pkgdesc="Creates a loopbacked filesystem to give better response times when using pacman."
arch=(any)
url=http://bbs.archlinux.org/viewtopic.php?id=20385
license=(unknown)
install=$pkgname.install
source=($pkgname pacman-uncage pacmandb.rc backup_pacmandb.cron pacmandb.service)
sha256sums=('1b6ac88496e134398c5ee3ac0d476f6ada26b91ad6f5234a73e73c0fde6906f5'
    '9128803cce031803f0249f2948440e69c9c80832d6ad31a7c1bc8d5b8f0cfe4f'
    'db04321ebd1198a8422b023b3195c29c9ed1f8c9811e1b9ab83454913ff7e2e7'
    'c4476eb20edf4ba88e06bf25d47c575c7567d431a60aa6d6d6b8a7107f633987'
    '861f7569cc4c5c21d0415cfd44187bc464ae80e2202c4981c1fd7e19fbca9d72')
sha512sums=('7776810ee584c2ddb5dc330552862f96b29f6a3c8969c7db273a5f7d6c9a2fcba19d104b19dec23813b3b19ba4da72177ca249c00b079a47f501d606e7f3ebf8'
    'd8c4308441a882560f4b8ceed23f75ff63204103a28086a9778fd28ab3ee2eece25ecc6ee1c75a3e3ee6af32461550834fd175771b7a66206267ce44eb2866bc'
    '68b464b4777ad443e3d3c295d361173099418b66617d054d0a8b4e1bd9a9906ac4855b8e8ffb5b46a2d101696cd2127d3173fa9d1940be6e17bf48d9b6db61fe'
    '3f45e140979040373c82eeb4a63cf138d776e11e461f1268dbb736e780f82a4b189134d36bd4dae32ce81d3c130f0f3aa554cb3f48b16d0b676ff4ffd6eeb4bb'
    '0c78094aa69abfb5d409a1ee98f4241ddfc6cf7c73b1ccae01df21b37b72970d6ad424d1bb983ae77992b13608b8adee10b3f689b3fd037d3f0638c5d9806d11')

package() {
    cd "$srcdir"
    install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
    install -Dm755 pacman-uncage "$pkgdir"/usr/bin/pacman-uncage
    #install -Dm755 pacmandb.rc "$pkgdir"/etc/rc.d/pacmandb
    install -Dm644 pacmandb.service "$pkgdir"/usr/lib/systemd/system/pacmandb.service

    ## Choose one if you wish to install the cron backup script.
    ## You also might want to change the backup dir inside the script.
    #install -Dm755 backup_pacmandb.cron "$pkgdir"/etc/cron.hourly/backup_pacmandb
    #install -Dm755 backup_pacmandb.cron "$pkgdir"/etc/cron.daily/backup_pacmandb
}
