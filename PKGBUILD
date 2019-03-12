# Maintainer: Holger Rauch <holger dot rauch at posteo dot de>

pkgver=5.191
_pkgmajver=$(echo $pkgver | cut -f1 -d.)
pkgrel=3
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

sha256sums=('f11375cf5ead8b0fc85f7e5c3ba21905692e0d06d1de39436e5be701040afba6'
            '9276630a47942e37756e23355ef60ce003bba93c712c4f04be62667494da17ff')

sha512sums=('56a827e67d98f7967505d83d6afe441b5f1597201ad04dbb1eb83771850db2a05452e8967277f2e08cb51f6a8a78080f81c83f3e4544d1ce43aff2d49082273b'
            '0a29479dd5dd11ba69383554d64fad35d438678e63274e107da2ab959c78be8809e4f8ca837f88a880dc69f09de330c253f00c4acbd6e70e5dac7b72826fe0bf')

package() {
    mkdir -p $pkgdir/opt/$pkgname
    cp -a META-INF MICRO-INF fish $pkgdir/opt/$pkgname
    install -D $srcdir/payara5-micro.service $pkgdir/usr/lib/systemd/system/payara5-micro.service
}
# vim:set ts=2 sw=2 et:
