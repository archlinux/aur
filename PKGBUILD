# Maintainer: Limao Luo <luolimao@gmail.com>
# Author: ody
# COntributor: Vithon <ratm@archlinux.us>
# Contributor: donvla
# Contributor: wain <wain@archlinux.fr>

pkgname=pacman-cage
pkgver=2.9.8.3
pkgrel=1
pkgdesc="Creates a loopbacked filesystem to give better response times when using pacman." 
arch=(any)
url="http://bbs.archlinux.org/viewtopic.php?id=20385" 
license=(GPL) 
install=$pkgname.install
source=($pkgname pacman-uncage pacmandb.rc backup_pacmandb.cron pacmandb.service)
sha256sums=('33dd7f3cfeb624ba72010aea2d69120899923d4e1e370b3e60224f69cbe620aa'
    'b48630fddf58cbb41511e4ed63e72a0f7e3055c9a7ac1ce8f19d49807949c471'
    '888886ba0d6c80172970ad8d06f245395fb5318cc96e2d7548e9a2247fe067f4'
    'c4476eb20edf4ba88e06bf25d47c575c7567d431a60aa6d6d6b8a7107f633987'
    'b6f9505c8665fdfce80c71ffa10d5bc9e2f6198925285c1fd3f7699f04aa6edb')
sha512sums=('b30e47f853298e2263159c78ba67cbbc8d94012c66ae0680b0f7344c57d58b524cb33f30ba70163e6d9378a32f05a425f1ba4e18f53ebc05c0a2b092c227b38c'
    'cfc4bc4b66724eeacd2e810c2dee9366344a6f96eea262ce8383b03c504d5c0272727b241424f9ac578d6d660b41875fcbce996f733e8454e574d5f2a871dee0'
    '9c5c937e164846c12d79b211d50399a1d9af8b291cf9973a83fa7e5a35d25b04d02fbb9c74869f29c26d98a19a17e2f6fa8c7498c282c186af7fa5ef35a1c1ca'
    '3f45e140979040373c82eeb4a63cf138d776e11e461f1268dbb736e780f82a4b189134d36bd4dae32ce81d3c130f0f3aa554cb3f48b16d0b676ff4ffd6eeb4bb'
    '833268b42711b04af2028193f62036a7bbb86e736ded6fce5adbc6aedfa366c73f317a0cfe3f275df2fc74f143d1ca7308ad5b7c6636b608d1c899f8caf10e53')

package() { 
    cd "$srcdir"/
    install -Dm755 pacman-cage "$pkgdir"/usr/bin/pacman-cage
    install -Dm755 pacman-uncage "$pkgdir"/usr/bin/pacman-uncage
    install -Dm755 pacmandb.rc "$pkgdir"/etc/rc.d/pacmandb

    ## Choose one if you wish to install the cron backup script.
    ## You also might want to change the backup dir inside the script.
    #install -Dm755 backup_pacmandb.cron "$pkgdir"/etc/cron.hourly/backup_pacmandb
    #install -Dm755 backup_pacmandb.cron "$pkgdir"/etc/cron.daily/backup_pacmandb

    ## Uncomment the following line to install the systemd service file.
    #install -Dm644 pacmandb.service "$pkgdir"/lib/systemd/system/pacmandb.service
}
