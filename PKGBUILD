# Maintainer: Tobias Leupold <tl at stonemx dot de>
pkgname=tftp-hpa-openrc
pkgver=20220723
pkgrel=1
pkgdesc="OpenRC tftp-hpa init script"
arch=( "any" )
license=( "GPL2" )
groups=( "openrc-system" )
provides=( "init-tptf-hpa" )
depends=( "openrc" "tftp-hpa" )
conflicts=( "init-tptf-hpa" )
backup=( "etc/conf.d/in.tftpd" )
source=( "in.tftpd.initd"
         "in.tftpd.confd" )
sha256sums=( "57fc8d603045563edf8cf657e2292f5cf830111002feb47af91e868d88733297"
             "55e67f871f070db2b7fa1428dabf55777ca87fecdbba7fa3b03e63c63734f977" )

package()
{
    install -Dm755 "$srcdir/in.tftpd.initd" "$pkgdir/etc/init.d/in.tftpd"
    install -Dm644 "$srcdir/in.tftpd.confd" "$pkgdir/etc/conf.d/in.tftpd"
}
