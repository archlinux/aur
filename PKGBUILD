# Maintainer: Senderman <doletov.fyodor@yandex.ru>

pkgname=zram-s6
pkgdesc="Activate zram using openrc"
pkgver=1.0
pkgrel=1
arch=('any')
groups=('s6-galaxy')
provides=('init-zram')
conflicts=('init-zram')
url="https://aur.archlinux.org/$pkgname"
depends=('s6-base')
license=('GPL2')
source=('up' 'down' 'type' 'zram.conf' 'dependencies')
md5sums=('68efba65bf6726047ce6387e3a20d863'
         '99b762d9f10dba97223c614698c7a362'
         '85bceea1fb94d4166f24496dc40a35e6'
         '89743c52e3b1960cba82d822d742dfcd'
         '061880f66eb1b0e2fda2bb6788385640')


package() {
    install -Dm0755 $srcdir/up           $pkgdir/etc/s6/sv/zram/up
    install -Dm0755 $srcdir/down         $pkgdir/etc/s6/sv/zram/down
    install -Dm0644 $srcdir/dependencies $pkgdir/etc/s6/sv/zram/dependencies
    install -Dm0644 $srcdir/type         $pkgdir/etc/s6/sv/zram/type
    install -Dm0644 $srcdir/zram.conf    $pkgdir/etc/s6/config/zram.conf
}
