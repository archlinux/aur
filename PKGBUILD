# Maintainer: Konstantin Stepanov <me@kstep.me>
pkgname=systemd-cron-next
pkgver=1.0.0.rc1
pkgrel=2
pkgdesc="systemd generator to generate timers/services from crontab and anacrontab files"
url="https://github.com/systemd-cron/systemd-cron-next"
arch=('any')
license=('GPL3')
depends=('systemd')
makedepends=('rust')
provides=('cron' 'anacron')
replaces=('cron' 'anacron')
source=('https://github.com/systemd-cron/systemd-cron-next/archive/v1.0.0-rc1.zip')
md5sums=('a7d5415795cd166d258f72e5cebcfaee')

build() {
    cd "$srcdir/systemd-cron-next-1.0.0-rc1"
    if which multirust; then
        multirust override stable
    fi
    ./configure --prefix="$pkgdir/usr"
    make build
}

package() {
    cd "$srcdir/systemd-cron-next-1.0.0-rc1"
    make install
}
