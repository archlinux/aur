# Maintainer: Tobias Leupold <tl at stonemx dot de>
pkgname=smartmontools-openrc
pkgver=20240817
pkgrel=1
pkgdesc="OpenRC smartmontools init script"
arch=( "any" )
license=( "GPL2" )
groups=( "openrc-system" )
provides=( "init-smartmontools" )
depends=( "openrc" "smartmontools" )
conflicts=( "init-smartmontools" )
backup=( "etc/conf.d/smartd" )
source=( "smartd.initd"
         "smartd.confd" )
sha256sums=( "acef10e3d963a97c32f525da730eac00be424e7588ab2d7b24ad24dfe032ac88"
             "714cc1b253e1f59b884be89693757fec91ca878c62f37451a49ef6bb72263e85" )

package()
{
    install -Dm755 "$srcdir/smartd.initd" "$pkgdir/etc/init.d/smartd"
    install -Dm644 "$srcdir/smartd.confd" "$pkgdir/etc/conf.d/smartd"
}
