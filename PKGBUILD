# $Id$
# Maintainer: Jonas Seibert <jonas+aur at seibert dot ninja>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: Holger Rauch <holger dot rauch at posteo dot de>

pkgname=payara
pkgver=5.192
pkgrel=6
pkgdesc="A Java EE application server, drived from GlassFish Open Source Edition."
url="http://www.payara.fish/"
license=("CDDL" "GPL2")
provides=("$pkgname")
conflicts=("$pkgname")
depends=("java-environment>=8")
arch=("any")
options=(!strip)
source=("$pkgname-$pkgver.zip::https://search.maven.org/remotecontent?filepath=fish/$pkgname/distributions/$pkgname/$pkgver/$pkgname-$pkgver.zip"
        "payara.service")

sha256sums=('272352a4d8a6fd19a0e3e02bde946fb9a860c1206fc6e39a41279a73f43b2995'
            '20be1d3d7c83fe75580e72154728929e560333a4027f5be39799babbe5da860d')
sha512sums=('277aed4644ae327be4ea64b7fe6ae0a82a0dc0c63005d8c9ce59c1a44002eecbef4038f3a652d13a8d28a33f80088f445ccfd672a2886e05aa933b4e5b601419'
            '5c176c6a547f86ee4ed633e36e131d34e0f6f633f5ca74f42b96f27f4b9f4c218c50ed06cbc9b8a92b4f10c7f19cd48823bcac4af8d46cf9ac3ce3da71873070')

package() {
    mkdir -p $pkgdir/opt
    cp -a payara5 $pkgdir/opt/
    install -D $srcdir/payara.service $pkgdir/usr/lib/systemd/system/payara.service
}
# vim:set ts=2 sw=2 et:
