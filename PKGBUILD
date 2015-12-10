# Maintainer: Konstantin Stepanov <me@kstep.me>
pkgname=systemd-cron-next
pkgver=1.0.0.rc1
pkgrel=1
pkgdesc="systemd generator to generate timers/services from crontab and anacrontab files"
url="https://github.com/systemd-cron/systemd-cron-next"
arch=('any')
license=('GPL3')
depends=('systemd')
makedepends=('rust')
provides=('cron' 'anacron')
replaces=('cron' 'anacron')
source=('https://github.com/systemd-cron/systemd-cron-next/archive/v1.0.0-rc1.zip')
md5sums=('cdd1fc3ee9a5beb2c829b0444ed173bb')

build() {
    cd "$srcdir/systemd-cron-next-master"
    ./configure --prefix="$pkgdir/usr"
    make build
}

package() {
    cd "$srcdir/systemd-cron-next-master"
    make install
}
