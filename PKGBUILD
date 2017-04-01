# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=payara
pkgver=4.1.1.171.1
pkgrel=1
pkgdesc="A Java EE application server, drived from GlassFish Open Source Edition."
url="http://www.payara.fish/"
license=("CDDL" "GPL2")
provides=("$pkgname")
conflicts=("$pkgname")
depends=("java-environment>=7")
arch=("any")
options=(!strip)
source=("$pkgname-$pkgver.zip::https://search.maven.org/remotecontent?filepath=fish/$pkgname/distributions/$pkgname/$pkgver/$pkgname-$pkgver.zip"
        "payara.service")

md5sums=('8b1b3b7dd59bb5e6fe30cc45140b8810'
         'a0cc30982527ddf863e3f2f37233071b')

package() {
    mkdir -p $pkgdir/opt
    mv payara41 $pkgdir/opt/
    install -D $srcdir/payara.service $pkgdir/usr/lib/systemd/system/payara.service
}
