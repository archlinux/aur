# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: Jonas Seibert <jonas+aur at seibert dot ninja>
# Contributor: Holger Rauch <holger dot rauch at posteo dot de>

pkgname=payara
pkgver=5.2020.7
pkgrel=1
pkgdesc="A Java EE application server, drived from GlassFish Open Source Edition."
url="http://www.payara.fish/"
license=("CDDL" "GPL2")
depends=("java-environment>=8")
arch=("any")
options=(!strip)
source=("$pkgname-$pkgver.zip::https://search.maven.org/remotecontent?filepath=fish/$pkgname/distributions/$pkgname/$pkgver/$pkgname-$pkgver.zip"
        "payara.service")

sha256sums=('518ee2a18477528b9fc9a28cfae0e988f5a8331aa0be092f2ce46476355c7bd1'
            '20be1d3d7c83fe75580e72154728929e560333a4027f5be39799babbe5da860d')
sha512sums=('bd6e93d4c451e045ea2e38c01821720c1c53ddc1329a85de1ac551c77e7be1bc9b568efebc44c58cdb4ac5f073699822b2a4ed631805fd73ea1b7e08c9dd0357'
            '5c176c6a547f86ee4ed633e36e131d34e0f6f633f5ca74f42b96f27f4b9f4c218c50ed06cbc9b8a92b4f10c7f19cd48823bcac4af8d46cf9ac3ce3da71873070')

package() {
	mkdir -p $pkgdir/opt
	cp -a payara5 $pkgdir/opt/
	install -D $srcdir/payara.service $pkgdir/usr/lib/systemd/system/payara.service
}
# vim:set ts=4 sw=4:
