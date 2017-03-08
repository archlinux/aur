# Maintainer: Moritz Bruder <muesli4@gmail.com>
pkgname=irexec-systemd
pkgver=1.1
pkgrel=1
pkgdesc='Service files for running irexec as systemd (user) service'
arch=('any')
license=('GPL')
url='https://github.com/muesli4/archlinux-packages'
depends=('lirc')
source=('irexec-system.service' 'irexec-user.service')

md5sums=('1758df800ef0c0c7050562112ba6f690' 'c8469721a20cd917b6cdb39657a9b3ff')

package() {
    # install user unit
    mkdir -p "$pkgdir/usr/lib/systemd/user/"
    cp 'irexec-user.service' "$pkgdir/usr/lib/systemd/user/irexec.service"

    # install system unit
    mkdir -p "$pkgdir/usr/lib/systemd/system/"
    cp 'irexec-system.service' "$pkgdir/usr/lib/systemd/system/irexec@.service"
}

