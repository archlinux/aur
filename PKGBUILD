# Maintainer: Holger Rauch <holger dot rauch at posteo dot de>

pkgver=5.184
_pkgmajver=$(echo $pkgver | cut -f1 -d.)
pkgrel=2
_prodvar=micro
_prodname=payara
pkgname=${_prodname}${_pkgmajver}-${_prodvar}
pkgdesc="A Java EE application server, derived from GlassFish Open Source Edition. (Micro Edition)"
url="http://www.payara.fish/"
license=("CDDL" "GPL2")
provides=("$pkgname")
conflicts=("$pkgname" "payara51")
depends=("java-environment>=8")
arch=("any")
options=(!strip)
source=("payara-${pkgver}-micro.zip::https://search.maven.org/remotecontent?filepath=fish/${_prodname}/extras/${_prodname}-${_prodvar}/$pkgver/${_prodname}-${_prodvar}-${pkgver}.jar"
        "payara5-micro.service")

sha256sums=('891a4d5d06e6dcaed8a34be9cc2e8538869dacaca6c1890f19ebbd491be2e011'
            '9276630a47942e37756e23355ef60ce003bba93c712c4f04be62667494da17ff')

sha512sums=('652f2f2b379c184287b8b4103970d08f1635c3265db2ce1baa0e6b8df472552a512689cdff7f0ce1283f3c313400e5589133b77538035dba96f7573e39a70def'
            '0a29479dd5dd11ba69383554d64fad35d438678e63274e107da2ab959c78be8809e4f8ca837f88a880dc69f09de330c253f00c4acbd6e70e5dac7b72826fe0bf')

package() {
    mkdir -p $pkgdir/opt/$pkgname
    cp -a META-INF MICRO-INF fish $pkgdir/opt/$pkgname
    install -D $srcdir/payara5-micro.service $pkgdir/usr/lib/systemd/system/payara5-micro.service
}
# vim:set ts=2 sw=2 et:
