# $Id$
# Maintainer: Jonas Seibert <jonas+aur at seibert dot ninja>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: Holger Rauch <holger dot rauch at posteo dot de>

pkgname=payara
pkgver=5.184
pkgrel=3
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

sha256sums=('e27efd6fb3752d870349848ee7f5edcace947148d415f60a217dc0e0fe6ced94'
            '20be1d3d7c83fe75580e72154728929e560333a4027f5be39799babbe5da860d')
sha512sums=('f6e65feb3d8b9c0426adf83b38a4cfd13dca20518a93c58428e9b29dc7e519ed77340e52fdead06068c0c4db6ba9439f49a8d2bc0825378e8c9a4d16763ab0ff'
            '5c176c6a547f86ee4ed633e36e131d34e0f6f633f5ca74f42b96f27f4b9f4c218c50ed06cbc9b8a92b4f10c7f19cd48823bcac4af8d46cf9ac3ce3da71873070')

package() {
    mkdir -p $pkgdir/opt
    cp -a payara5 $pkgdir/opt/
    install -D $srcdir/payara.service $pkgdir/usr/lib/systemd/system/payara.service
}
# vim:set ts=2 sw=2 et:
