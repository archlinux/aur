# Maintainer: Tobias Leupold <tl at stonemx dot de>
pkgname=msmtp-openrc
pkgver=20221222
pkgrel=1
pkgdesc="OpenRC msmtpd init script"
arch=( "any" )
license=( "GPL2" )
groups=( "openrc-system" )
provides=( "init-msmtp" )
depends=( "openrc" "msmtp" )
conflicts=( "init-msmtp" )
backup=( "etc/conf.d/msmtpd" )
source=( "msmtpd.initd"
         "msmtpd.confd"
         "msmtpd.sysusersd" )
sha256sums=( "8cea5071f45bcef56694f2cd5354e0b1af3e9c1ea42d188e75e6459bb9dc669e"
             "1803ae854da3a60e816cf3bc42b4a224b3150472b29023498fcbdf1c636056f9"
             "3be53ad61d72086e951f1b579fbf229eac1115d117aca5810f6616b044edbed8" )

package()
{
    install -Dm755 "$srcdir/msmtpd.initd" "$pkgdir/etc/init.d/msmtpd"
    install -Dm644 "$srcdir/msmtpd.confd" "$pkgdir/etc/conf.d/msmtpd"
    install -Dm644 "$srcdir/msmtpd.sysusersd" "$pkgdir/usr/lib/sysusers.d/msmtpd.conf"
}
