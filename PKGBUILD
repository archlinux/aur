# $Id$
# Maintainer: Jonas Seibert <jonas+aur at seibert dot ninja>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=payara41
pkgver=4.1.2.181
pkgrel=2
pkgdesc="A Java EE application server, drived from GlassFish Open Source Edition."
url="http://www.payara.fish/"
license=("CDDL" "GPL2")
provides=("$pkgname")
conflicts=("$pkgname")
depends=("java-environment>=7")
arch=("any")
options=(!strip)
source=("payara-$pkgver.zip::https://search.maven.org/remotecontent?filepath=fish/payara/distributions/payara/$pkgver/payara-$pkgver.zip"
        "payara41.service")

sha256sums=('22715740317b665a35ba4d02e84b62c0c54471143503a35ff8aa2d3c59f622a0'
            '275a01eb5506ca6f47f68f494ea7fa7f7476de0884ae3da05edfd88cfd23e4ce')

package() {
    mkdir -p $pkgdir/opt
    cp -a payara41 $pkgdir/opt/
    install -D $srcdir/payara41.service $pkgdir/usr/lib/systemd/system/payara41.service
}
# vim:set ts=2 sw=2 et:
