# Maintainer: Tobias Leupold <tl at stonemx dot de>
pkgname=incron-openrc
pkgver=20230202
pkgrel=1
pkgdesc="OpenRC incron init script"
arch=( "any" )
license=( "GPL2" )
groups=( "openrc-system" )
provides=( "init-incron" )
depends=( "openrc" "incron" )
conflicts=( "init-incron" )
backup=( "etc/conf.d/incrond" )
source=( "incrond.initd"
         "incrond.confd" )
sha256sums=( "7d7319ecd3c3996b3c6e06b684d5954c23602c21c6fcc6d14a17b15a49ac3280"
             "74163bbb348555b2f98ea2814696763078f8ee5fd243c06e0e1ee3a12642b83d" )

package()
{
    install -Dm755 "$srcdir/incrond.initd" "$pkgdir/etc/init.d/incrond"
    install -Dm644 "$srcdir/incrond.confd" "$pkgdir/etc/conf.d/incrond"
}
