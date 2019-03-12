# $Id$
# Maintainer: Jonas Seibert <jonas+aur at seibert dot ninja>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: Holger Rauch <holger dot rauch at posteo dot de>

pkgname=payara
pkgver=5.191
pkgrel=4
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

sha256sums=('532eba0feb7b637663acfe5c1c47506a3270da89eb3ea4c870df1a650a25fb17'
            '20be1d3d7c83fe75580e72154728929e560333a4027f5be39799babbe5da860d')
sha512sums=('7afda3a270f8c1ebea7b43b756991619c963112bc5cebd1e1949555f6efd5189f29cea7f012d49848363aac2dc12feb8c88f88f707d19d2cb5cfc9b9800c10ea'
            '5c176c6a547f86ee4ed633e36e131d34e0f6f633f5ca74f42b96f27f4b9f4c218c50ed06cbc9b8a92b4f10c7f19cd48823bcac4af8d46cf9ac3ce3da71873070')

package() {
    mkdir -p $pkgdir/opt
    cp -a payara5 $pkgdir/opt/
    install -D $srcdir/payara.service $pkgdir/usr/lib/systemd/system/payara.service
}
# vim:set ts=2 sw=2 et:
