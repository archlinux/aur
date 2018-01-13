# $Id$
# Maintainer: Jonas Seibert <jonas+aur at seibert dot ninja>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=payara
pkgver=4.1.2.174
pkgrel=2
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

sha256sums=('50460b818a63a25777e5c1514d1c39ecccd7f8170ed9d6a2f1c7c6192173e017'
            'ab5c47bdba5daf459b6422e4eeaa9a609a8d0e25a942f7c6a9e891098e9b6232')

package() {
    mkdir -p $pkgdir/opt
    cp -a payara41 $pkgdir/opt/
    install -D $srcdir/payara.service $pkgdir/usr/lib/systemd/system/payara.service
}
# vim:set ts=2 sw=2 et:
