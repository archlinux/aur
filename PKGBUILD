# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: Jonas Seibert <jonas+aur at seibert dot ninja>
# Contributor: Holger Rauch <holger dot rauch at posteo dot de>

pkgname=payara
pkgver=5.2021.1
pkgrel=1
pkgdesc="Jakarta EE (Java EE) & MicroProfile compatible application server for production and containerized deployments."
url="http://www.payara.fish/"
license=("CDDL" "GPL2")
depends=("java-environment>=8")
arch=("any")
options=(!strip)
source=("$pkgname-$pkgver.zip::https://search.maven.org/remotecontent?filepath=fish/$pkgname/distributions/$pkgname/$pkgver/$pkgname-$pkgver.zip"
        "payara.service")

sha256sums=('2b90d704581975d0d0eff1da7383e636504e65f80cd18b667a28d353efac7982'
            '20be1d3d7c83fe75580e72154728929e560333a4027f5be39799babbe5da860d')
sha512sums=('74d990937be206a0dd90cd6c021e9569a9e712f6d954e6e5b364afb500fcaf535e270f7d3505c892dd19ce7969aae0c511b00b585e7c2c05f9d94dcb2d2237e1'
            '5c176c6a547f86ee4ed633e36e131d34e0f6f633f5ca74f42b96f27f4b9f4c218c50ed06cbc9b8a92b4f10c7f19cd48823bcac4af8d46cf9ac3ce3da71873070')

package() {
	mkdir -p $pkgdir/opt
	cp -a payara5 $pkgdir/opt/
	install -D $srcdir/payara.service $pkgdir/usr/lib/systemd/system/payara.service
}
# vim:set ts=4 sw=4:
